import UIKit

extension Container {

    func tabBarViewController(viewControllers: [UIViewController]) -> TabBarViewController {
        return TabBarViewController(viewModel: tabBarViewModel(),
                                    viewControllers: viewControllers,
                                    animator: Animator())
    }

    func tabBarViewModel() -> TabBarViewModeling & TabBarOperating {
        return sharedTabBarViewModel
    }

}
