import UIKit

extension UIViewController {

    func embed(viewController: UIViewController, in container: UIView) {
        guard view.subviews.contains(container) else {
            fatalError("container must be one of the subviews of viewController's view")
        }
        viewController.willMove(toParent: self)
        beginAppearanceTransition(false, animated: false)
        viewController.beginAppearanceTransition(true, animated: false)
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.pinEdges(to: container)
        viewController.didMove(toParent: self)
        viewController.endAppearanceTransition()
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
