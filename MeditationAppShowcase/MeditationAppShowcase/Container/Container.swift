import UIKit

class Container {

    lazy var sharedAppConfigurator = {
        return AppConfigurator(viewControllersFactory: appViewControllersFactory(),
                               animator: Animator(type: .linear))
    }()

    lazy var sharedActionViewModel = {
        return ActionViewModel()
    }()

}
