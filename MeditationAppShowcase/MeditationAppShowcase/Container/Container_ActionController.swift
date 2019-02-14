import UIKit

protocol ActionControllerContaining {
    func actionViewController() -> UIViewController & ActionViewControlling
}

extension Container: ActionControllerContaining {

    // MARK: - ActionControllerContaining

    func actionViewController() -> UIViewController & ActionViewControlling {
        return ActionViewController()
    }

}
