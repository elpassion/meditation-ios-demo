import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on base: UIViewController)
    func dismiss(viewController: UIViewController)
}

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresenting

    func present(viewController: UIViewController, on base: UIViewController) {
        base.present(viewController, animated: false, completion: nil)
    }

    func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: false, completion: nil)
    }

}
