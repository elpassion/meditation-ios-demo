import UIKit

class Container {

    lazy var sharedAppConfigurator = {
        return AppConfigurator(viewControllersFactory: appViewControllersFactory(),
                               animator: Animator())
    }()

    lazy var sharedActionViewModel = {
        return ActionViewModel()
    }()

    lazy var sharedTabBarViewModel = {
        return TabBarViewModel()
    }()

}
