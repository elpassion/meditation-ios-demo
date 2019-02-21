import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on base: UIViewController)
    func dismiss(viewController: UIViewController)
}

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresenting

    func present(viewController: UIViewController, on base: UIViewController) {
        base.embed(viewController: viewController, in: base.view)
    }

    func dismiss(viewController: UIViewController) {
        viewController.unembed()
    }

}
