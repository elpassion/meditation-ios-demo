import UIKit

class TabBarViewController: UIViewController {

    let viewControllers: [UIViewController]

    init(viewModel: TabBarViewModeling,
         viewControllers: [UIViewController],
         animator: Animating) {
        self.viewModel = viewModel
        self.viewControllers = viewControllers
        self.animator = animator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func loadView() {
        view = TabBarView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialViewController()
        configureViewModel()
        updateBar(isVisible: false, animated: false)
    }

    // MARK: - Privates

    private let viewModel: TabBarViewModeling
    private let animator: Animating

    private var tabBarView: TabBarView! {
        return view as? TabBarView
    }

    private func configureInitialViewController() {
        guard let initialViewController = viewControllers.first else { return }
        embed(viewController: initialViewController, in: tabBarView.containerView)
    }

    private func configureViewModel() {
        viewModel.isBarVisibleUpdated = { [weak self] in self?.updateBar(isVisible: $0) }
    }

    private func updateBar(isVisible: Bool, animated: Bool = true) {
        let offset = isVisible ? 0 : tabBarView.frame.size.height
        animator.animate(duration: 0.3,
                         animations: {
                                self.tabBarView.bottomBarConstraint?.constant = offset
                                self.tabBarView.layoutIfNeeded()
                         }
        )
    }

}
