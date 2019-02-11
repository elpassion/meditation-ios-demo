import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on base: UIViewController)
}

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresenting

    func present(viewController: UIViewController, on base: UIViewController) {
        base.present(viewController, animated: false, completion: nil)
    }

}
