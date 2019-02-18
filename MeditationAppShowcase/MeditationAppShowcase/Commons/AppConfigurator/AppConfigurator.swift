import UIKit

protocol AppConfiguring {
    func configure(window: UIWindow)
}

protocol ActionViewControllerOperating {
    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool)
    var currentBottomOffset: CGFloat { get }
    var currentHeight: CGFloat { get }
}

class AppConfigurator: AppConfiguring, ActionViewControllerOperating {

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

    // MARK: - ActionViewControllerOperating
    // TODO: move that functionality somewhere else

    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool) {
        animator.animate(duration: animated ? 0.25 : 0,
                         animations: {
                            self.actionViewControllerBottomConstraint?.constant = -bottomOffset
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
    private let animator: Animating
    private var actionViewController: UIViewController?
    private var actionViewControllerBottomConstraint: NSLayoutConstraint?

}
