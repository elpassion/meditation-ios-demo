import UIKit

protocol ActionContaining {
    func actionViewController() -> UIViewController
}

extension Container: ActionContaining {

    // MARK: - ActionControllerContaining

    func actionViewController() -> UIViewController {
        return ActionViewController(viewModel: sharedActionViewModel,
                                    animator: Animator())
    }

}
