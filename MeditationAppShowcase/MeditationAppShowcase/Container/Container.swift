import UIKit

class Container {

    lazy var sharedActionButtonConfigurator = {
        return ActionButtonConfigurator()
    }()
    
}
