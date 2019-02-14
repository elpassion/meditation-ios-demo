import UIKit

class HomeViewController: UIViewController, ActionViewControllerDelegate {

    init(viewModel: HomeViewModeling,
         notificationHandler: NotificationHandling,
         presenter: ViewControllerPresenting,
         meditationViewControllerFactory: @escaping () -> UIViewController,
         actionControllerOperator: ActionControllerOperating) {
        self.viewModel = viewModel
        self.notificationHandler = notificationHandler
        self.presenter = presenter
        self.meditationViewControllerFactory = meditationViewControllerFactory
        self.actionControllerOperator = actionControllerOperator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureNotificationHandler()


        actionControllerOperator.controller?.addTarget(self, action: #selector(action))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
        actionControllerOperator.controller?.delegate = self
        let bottomOffset = homeView.frame.size.height -
            (homeView.boardView.frame.origin.y + homeView.boardView.frame.size.height) - 20
        actionControllerOperator.updateBottomOffset(bottomOffset, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        actionControllerOperator.controller?.delegate = nil
    }

    // MARK: - ActionViewControllerDelegate

    func actionViewControllerDidPerformEvent(_ event: ActionViewController.Event) {
        if event == .button {
            viewModel.action()
        }
    }

    // MARK: - Privates

    private let viewModel: HomeViewModeling
    private let notificationHandler: NotificationHandling
    private let presenter: ViewControllerPresenting
    private let meditationViewControllerFactory: () -> UIViewController
    private let actionControllerOperator: ActionControllerOperating

    private var homeView: HomeView! {
        return view as? HomeView
    }

    private func setupSubviews() {
        viewModel.greeting = { [homeView] in homeView?.helloLabel.text = $0 }
        viewModel.backgroundRipImage = { [homeView] in homeView?.backgroundRipImageView.image = $0 }
        viewModel.ripImage = { [homeView] in homeView?.ripImageView.image = $0 }
        viewModel.relaxationPercentage = { [homeView] in homeView?.boardView.titleValueLabel.text = $0 }
        viewModel.stress = { [homeView] in homeView?.boardView.stressValueLabel.text = $0 }
        viewModel.meditate = { [homeView] in homeView?.boardView.meditateValueLabel.text = $0 }
        viewModel.focus = { [homeView] in homeView?.boardView.focusValueLabel.text = $0 }
        viewModel.actionTitle = { [actionControllerOperator] in
            actionControllerOperator.controller?.currentMode = .singleButton(title: $0)
        }
        viewModel.presentMeditation = { [weak self] in
            guard let self = `self` else { return }
            let meditationViewController = self.meditationViewControllerFactory()
            let completion = { self.presenter.present(viewController: meditationViewController,
                                                      on: self) }
            self.homeView.animateDismission(completion: completion)
        }
        viewModel.viewDidLoad()
    }

    private func configureNotificationHandler() {
        notificationHandler.addObserver(self,
                                        selector: #selector(restartAnimation),
                                        name: UIApplication.willEnterForegroundNotification,
                                        object: nil)
    }

    private func animateBackground() {
        let initialRotation = CGFloat.pi * 0.015
        homeView.backgroundRipImageView.transform = CGAffineTransform(rotationAngle: -initialRotation)
        UIView.animateKeyframes(withDuration: 4.0,
                                delay: 0.0,
                                options: [.repeat, .autoreverse, .beginFromCurrentState, .calculationModeDiscrete],
                                animations: {
                                    let transform = CGAffineTransform(rotationAngle: 2 * initialRotation)
                                    self.homeView.backgroundRipImageView.transform = transform
                                },
                                completion: nil)
    }

    @objc private func restartAnimation() {
        animateBackground()
    }

    @objc func action() {
        print("action")
    }

}
