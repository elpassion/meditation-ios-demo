import UIKit

class HomeViewController: UIViewController {

    init(viewModel: HomeViewModeling,
         notificationHandler: NotificationHandling,
         presenter: ViewControllerPresenting,
         meditationViewControllerFactory: @escaping (MeditationViewModeling) -> UIViewController,
         actionViewControllerOperator: ActionViewControllerOperating,
         animator: Animating) {
        self.viewModel = viewModel
        self.notificationHandler = notificationHandler
        self.presenter = presenter
        self.meditationViewControllerFactory = meditationViewControllerFactory
        self.actionViewControllerOperator = actionViewControllerOperator
        self.animator = animator
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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
        let topOffset = homeView.boardView.frame.origin.y +
            homeView.boardView.frame.size.height -
            actionViewControllerOperator.currentHeight() / 2 + 10
        actionViewControllerOperator.updateTopOffset(topOffset, animated: true)
        addNotificationHandler()
        viewModel.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotificationHandler()
        viewModel.viewWillDisappear()
    }

    // MARK: - Privates

    private let viewModel: HomeViewModeling
    private let notificationHandler: NotificationHandling
    private let presenter: ViewControllerPresenting
    private let meditationViewControllerFactory: (MeditationViewModeling) -> UIViewController
    private let actionViewControllerOperator: ActionViewControllerOperating
    private let animator: Animating

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
        viewModel.presentMeditation = { [weak self] viewModel in self?.presentMeditation(viewModel) }
        viewModel.dismissMeditation = { [weak self] in self?.dismissMeditation() }
        viewModel.viewDidLoad()
    }

    private func animateBackground() {
        let initialRotation = CGFloat.pi * 0.015
        homeView.backgroundRipImageView.transform = CGAffineTransform(rotationAngle: -initialRotation)
        animator.animateKeyframes(duration: 4.0,
                                  options: [.repeat,
                                            .autoreverse,
                                            .beginFromCurrentState,
                                            .calculationModeDiscrete],
                                  animations: {
                                        let transform = CGAffineTransform(rotationAngle: 2 * initialRotation)
                                        self.homeView.backgroundRipImageView.transform = transform
                         }
        )
    }

    // MARK: - Presentation

    private var meditationViewController: UIViewController?

    private func presentMeditation(_ viewModel: MeditationViewModeling) {
        let viewController = self.meditationViewControllerFactory(viewModel)
        let completion = { self.presenter.present(viewController: viewController,
                                                  on: self) }
        homeView.animateDismission(completion: completion)
        meditationViewController = viewController
    }

    private func dismissMeditation() {
        guard let viewController = meditationViewController else { return }
        presenter.dismiss(viewController: viewController)
        meditationViewController = nil
    }

    // MARK: - Handlers

    @objc private func restartAnimation() {
        animateBackground()
    }

    private func addNotificationHandler() {
        notificationHandler.addObserver(self,
                                        selector: #selector(restartAnimation),
                                        name: UIApplication.willEnterForegroundNotification,
                                        object: nil)
    }

    private func removeNotificationHandler() {
        notificationHandler.removeObserver(self)
    }

}
