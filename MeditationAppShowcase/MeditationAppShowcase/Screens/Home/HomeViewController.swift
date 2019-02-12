import UIKit

class HomeViewController: UIViewController {

    init(viewModel: HomeViewModeling,
         notificationHandler: NotificationHandling,
         presenter: ViewControllerPresenting,
         meditationViewControllerFactory: @escaping () -> UIViewController,
         actionButtonOperator: ActionButtonOperating) {
        self.viewModel = viewModel
        self.notificationHandler = notificationHandler
        self.presenter = presenter
        self.meditationViewControllerFactory = meditationViewControllerFactory
        self.actionButtonOperator = actionButtonOperator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureNotificationHandler()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
    }

    // MARK: - Privates

    private let viewModel: HomeViewModeling
    private let notificationHandler: NotificationHandling
    private let presenter: ViewControllerPresenting
    private let meditationViewControllerFactory: () -> UIViewController
    private let actionButtonOperator: ActionButtonOperating

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
        viewModel.actionTitle = { [homeView] in homeView?.actionButton.setStyledTitle($0) }
        homeView.actionButton.tap = { [viewModel] in viewModel.action() }
        viewModel.presentMeditation = { [weak self] in
            guard let self = `self` else { return }
            let vc = UIViewController()
            vc.view.backgroundColor = .red
            let completion = { self.presenter.present(viewController: vc, on: self) }
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

}
