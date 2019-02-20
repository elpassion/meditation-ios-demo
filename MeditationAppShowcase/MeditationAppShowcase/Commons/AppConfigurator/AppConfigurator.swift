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
        let tabBarViewController = viewControllersFactory.tabBar([viewControllersFactory.home()])
        window.rootViewController = tabBarViewController

        let actionViewController = viewControllersFactory.action()
        self.actionViewController = actionViewController
        window.addSubview(actionViewController.view)

        actionViewController.view.pinCenterX(to: window.centerXAnchor)
        actionViewControllerBottomConstraint = actionViewController.view.pinBottom(to: window.bottomAnchor)

        window.makeKeyAndVisible()
        window.bringSubviewToFront(actionViewController.view)
    }

    var actionViewControllerBottomConstraint: NSLayoutConstraint?
    var actionViewController: UIViewController?

}
