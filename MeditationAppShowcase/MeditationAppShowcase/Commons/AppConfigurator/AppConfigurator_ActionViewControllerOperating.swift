import UIKit

protocol ActionViewControllerOperating {
    func updateTopOffset(_ topOffset: CGFloat, animated: Bool)
    func currentHeight() -> CGFloat
}

extension AppConfigurator {

    // MARK: - ActionViewControllerOperating

    func updateTopOffset(_ topOffset: CGFloat, animated: Bool) {
        guard let topConstraintOffset = actionViewControllerTopConstraint,
            let actionViewController = actionViewController else {
                fatalError("AppConfigurator must be configured first")
        }
        animator.animate(duration: animated ? 0.25 : 0,
                         animations: {
                                topConstraintOffset.constant = topOffset
                                actionViewController.view.layoutIfNeeded()
                         }
        )
    }

    func currentHeight() -> CGFloat {
        return actionViewController?.view.frame.height ?? 0
    }

}
