import UIKit

protocol AppConfiguring {
    func configure()
}

class AppConfigurator: AppConfiguring, ActionViewControllerOperating {

    let viewControllersFactory: AppViewControllersFactory
    let animator: Animating

    init(viewControllersFactory: AppViewControllersFactory,
         animator: Animating) {
        self.viewControllersFactory = viewControllersFactory
        self.animator = animator
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }

    // MARK: - AppConfiguring

    func configure() {
        let tabBarViewController = viewControllersFactory.tabBar([viewControllersFactory.home()])
        window.rootViewController = tabBarViewController

        let actionViewController = viewControllersFactory.action()
        self.actionViewController = actionViewController
        window.addSubview(actionViewController.view)

        actionViewController.view.pinCenterX(to: window.centerXAnchor)
        actionViewControllerTopConstraint = actionViewController.view.pinTop(to: window.safeAreaLayoutGuide.topAnchor)

        window.makeKeyAndVisible()
        window.bringSubviewToFront(actionViewController.view)
    }

    var actionViewControllerTopConstraint: NSLayoutConstraint?
    var actionViewController: UIViewController?
    let window: UIWindow

}
