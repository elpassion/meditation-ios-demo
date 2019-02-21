import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on base: UIViewController)
    func dismiss(viewController: UIViewController)
}

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresenting

    func present(viewController: UIViewController, on base: UIViewController) {
        base.beginAppearanceTransition(false, animated: false)
        viewController.beginAppearanceTransition(true, animated: false)
        base.embed(viewController: viewController, in: base.view)
        viewController.endAppearanceTransition()
    }

    func dismiss(viewController: UIViewController) {
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.parent?.beginAppearanceTransition(false, animated: false)
        viewController.unembed()
        viewController.parent?.endAppearanceTransition()
    }

}
