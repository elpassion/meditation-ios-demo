import UIKit

extension UIViewController {

    func embed(viewController: UIViewController, in container: UIView) {
        guard view === container || view.subviews.contains(container) else {
            fatalError("container must be view or one of the base viewController view subviews")
        }
        viewController.willMove(toParent: self)
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.pinEdges(to: container)
        viewController.didMove(toParent: self)
    }

    func unembed() {
        beginAppearanceTransition(false, animated: false)
        parent?.beginAppearanceTransition(true, animated: false)
        willMove(toParent: parent)
        view.removeFromSuperview()
        didMove(toParent: parent)
        parent?.endAppearanceTransition()
        removeFromParent()
    }

}
