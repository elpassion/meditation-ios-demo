import UIKit

class TabBarViewController: UIViewController {

    let viewControllers: [UIViewController]

    init(viewModel: TabBarViewModeling,
         viewControllers: [UIViewController],
         animator: Animating) {
        self.viewControllers = viewControllers
        self.viewModel = viewModel
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
        configureSubviews()
    }

    // MARK: - Privates

    private let viewModel: TabBarViewModeling
    private let animator: Animating

    private var tabBarView: TabBarView! {
        return view as? TabBarView
    }

    private func configureInitialViewController() {
        guard let initialViewController = viewControllers.first else { return }
        tabBarView.addSubview(initialViewController.view)
        initialViewController.willMove(toParent: self)
        addChild(initialViewController)
        initialViewController.view.pinEdges(to: tabBarView.containerLayoutGuide)
        initialViewController.didMove(toParent: self)
    }

    private func configureSubviews() {
        viewModel.isBarVisibleUpdated = { [weak self] in self?.updateBar(isVisible: $0) }
    }

    private func updateBar(isVisible: Bool) {
        let offset = isVisible ? 0 : tabBarView.bottomView.frame.height
        animator.animate(duration: 0.3,
                         animations: {
                                self.tabBarView.bottomBarConstraint?.constant = offset
                                self.tabBarView.layoutIfNeeded()
                         }
        )
    }

}
