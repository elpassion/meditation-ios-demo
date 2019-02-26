import UIKit

class Container {

    lazy var sharedAppConfigurator = {
        AppConfigurator(viewControllersFactory: appViewControllersFactory(),
                        animator: Animator())
    }()

    lazy var sharedActionViewModel = {
        ActionViewModel()
    }()

    lazy var sharedTabBarViewModel = {
        TabBarViewModel()
    }()

}
