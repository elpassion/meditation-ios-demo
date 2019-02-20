import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on base: UIViewController)
    func dismiss(viewController: UIViewController)
}

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresenting

    func present(viewController: UIViewController, on base: UIViewController) {
        viewController.willMove(toParent: base)
        base.beginAppearanceTransition(false, animated: false)
        viewController.beginAppearanceTransition(true, animated: false)
        base.addChild(viewController)
        base.view.addSubview(viewController.view)
        viewController.view.pinEdges(to: base.view)
        viewController.didMove(toParent: base)
        viewController.endAppearanceTransition()
    }

    func dismiss(viewController: UIViewController) {
        viewController.beginAppearanceTransition(false, animated: false)
        viewController.parent?.beginAppearanceTransition(true, animated: false)
        viewController.willMove(toParent: viewController.parent)
        viewController.view.removeFromSuperview()
        viewController.didMove(toParent: viewController.parent)
        viewController.parent?.endAppearanceTransition()
        viewController.removeFromParent()
    }

}
