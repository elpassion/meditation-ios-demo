import UIKit

protocol AppConfiguring {
    func configure(window: UIWindow)
}

class AppConfigurator: AppConfiguring, ActionViewControllerOperating {

    let viewControllersFactory: AppViewControllersFactory
    let animator: Animating

    init(viewControllersFactory: AppViewControllersFactory,
         animator: Animating) {
        self.viewControllersFactory = viewControllersFactory
        self.animator = animator
    }

    // MARK: - AppConfiguring

    func configure(window: UIWindow) {
        window.rootViewController = viewControllersFactory.home()

        let actionViewController = viewControllersFactory.action()
        self.actionViewController = actionViewController
        actionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(actionViewController.view)

        let bottomConstraint = actionViewController.view.bottomAnchor.constraint(equalTo: window.bottomAnchor)

        NSLayoutConstraint.activate([
            actionViewController.view.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            bottomConstraint
        ])
        actionViewControllerBottomConstraint = bottomConstraint

        window.makeKeyAndVisible()
        window.bringSubviewToFront(actionViewController.view)
    }

    var actionViewControllerBottomConstraint: NSLayoutConstraint?
    var actionViewController: UIViewController?

}
