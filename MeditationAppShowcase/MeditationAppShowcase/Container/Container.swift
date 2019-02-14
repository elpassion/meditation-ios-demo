import UIKit

class Container {

    lazy var sharedAppConfigurator = {
        return AppConfigurator(viewControllersFactory: appViewControllersFactory())
    }()

}
