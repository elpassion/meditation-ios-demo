import UIKit

protocol AppConfiguring {
    func configure(window: UIWindow)
}

protocol ActionControllerOperating {
    var controller: ActionViewControlling? { get }
}

protocol ActionViewControllerOperating {
    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool)
    var currentBottomOffset: CGFloat { get }
    var currentHeight: CGFloat { get }
}

class AppConfigurator: AppConfiguring, ActionControllerOperating, ActionViewControllerOperating {

    init(viewControllersFactory: AppViewControllersFactory) {
        self.viewControllersFactory = viewControllersFactory
    }

    // MARK: - AppConfiguring

    func configure(window: UIWindow) {
        window.rootViewController = viewControllersFactory.home()

        let actionViewController = viewControllersFactory.actionController()
        self.actionViewController = actionViewController
        actionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(actionViewController.view)

        let centerX = actionViewController.view.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        let bottomConstraint = actionViewController.view.bottomAnchor.constraint(equalTo: window.bottomAnchor)

        NSLayoutConstraint.activate([bottomConstraint, centerX])
        actionButtomBottomConstraint = bottomConstraint
        actionViewController.view.layoutIfNeeded()

        window.makeKeyAndVisible()
        window.bringSubviewToFront(actionViewController.view)
    }

    // MARK: - ActionControllerOperating

    var controller: ActionViewControlling? {
        return actionViewController
    }

    // MARK: - ActionViewControllerOperating

    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.25 : 0,
                       animations: {
                            self.actionButtomBottomConstraint?.constant = -bottomOffset
                            self.actionViewController?.view.layoutIfNeeded()
                       })
        currentBottomOffset = bottomOffset
    }

    var currentBottomOffset: CGFloat = 0

    var currentHeight: CGFloat {
        return actionViewController?.view.frame.height ?? 0
    }

    // MARK: - Privates

    private let viewControllersFactory: AppViewControllersFactory
    private var actionViewController: (UIViewController & ActionViewControlling)?
    private var actionButtomBottomConstraint: NSLayoutConstraint?

}
