import UIKit

class HomeViewController: UIViewController {

    init(viewModel: HomeViewModeling,
         notificationHandler: NotificationHandling) {
        self.viewModel = viewModel
        self.notificationHandler = notificationHandler
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

    private var homeView: HomeView! {
        return view as? HomeView
    }

    private func setupSubviews() {
        viewModel.backgroundRipImage = { [homeView] in homeView?.backgroundRipImageView.image = $0 }
        viewModel.ripImage = { [homeView] in homeView?.ripImageView.image = $0 }
        viewModel.boardBackgroundImage = { [homeView] in homeView?.boardImageView.image = $0 }
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
                                animations: { self.homeView.backgroundRipImageView.transform = CGAffineTransform(rotationAngle: 2 * initialRotation) },
                                completion: nil)
    }

    @objc private func restartAnimation() {
        animateBackground()
    }

}

