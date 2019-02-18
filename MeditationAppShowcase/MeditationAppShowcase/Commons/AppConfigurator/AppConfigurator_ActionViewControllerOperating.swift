import UIKit

protocol ActionViewControllerOperating {
    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool)
    func currentHeight() -> CGFloat
}

extension AppConfigurator {

    // MARK: - ActionViewControllerOperating

    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool) {
        guard let bottomConstraintOffset = actionViewControllerBottomConstraint,
            let actionViewController = actionViewController else {
                fatalError("AppConfigurator must be configured first")
        }
        animator.animate(duration: animated ? 0.25 : 0,
                         animations: {
                            bottomConstraintOffset.constant = -bottomOffset
                            actionViewController.view.layoutIfNeeded()
        })
    }

    func currentHeight() -> CGFloat {
        return actionViewController?.view.frame.height ?? 0
    }

}
