import UIKit

protocol ActionContaining {
    func actionViewController() -> UIViewController
}

extension Container: ActionContaining {

    // MARK: - ActionControllerContaining

    func actionViewController() -> UIViewController {
        return ActionViewController(viewModel: sharedActionViewModel,
                                    animator: actionViewControllerAnimator())
    }

    // MARK: - Privates

    private func actionViewControllerAnimator() -> Animating {
        return Animator(type: .dynamic(damping: 0.6,
                                       velocity: 0.5))
    }

}
