import UIKit

protocol AppConfiguring {
    func configure(window: UIWindow)
}

protocol ActionControllerOperating {
    var controller: ActionViewControlling? { get }
    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool)
    var currentBottomOffset: CGFloat { get }
    var currentHeight: CGFloat { get }
}

class AppConfigurator: AppConfiguring, ActionControllerOperating {

    init(viewControllersFactory: AppViewControllersFactory) {
        self.viewControllersFactory = viewControllersFactory
    }

    // MARK: - ActionButtonConfiguring

    func configure(window: UIWindow) {
        window.rootViewController = viewControllersFactory.home()
        window.makeKeyAndVisible()

        let actionViewController = viewControllersFactory.actionController()
        actionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(actionViewController.view)

        let centerX = actionViewController.view.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        let bottomConstraint = actionViewController.view.bottomAnchor.constraint(equalTo: window.bottomAnchor)

        NSLayoutConstraint.activate([bottomConstraint, centerX])
        actionButtomBottomConstraint = bottomConstraint
    }

    // MARK: - ActionButtonOperating

    var controller: ActionViewControlling? {
        return actionViewController
    }

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
