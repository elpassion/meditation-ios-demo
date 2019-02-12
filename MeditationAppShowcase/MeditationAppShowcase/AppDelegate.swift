import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let actionButton = container.actionButton()
        let actionButtonConfigurator = container.actionButtonConfigurator()
        actionButtonConfigurator.configure(actionButton: actionButton, with: window)
        window.rootViewController = container.homeViewController()
        window.makeKeyAndVisible()

        window.bringSubviewToFront(actionButton)

        self.window = window
        return true
    }

    // MARK: - Privates

    private lazy var container: HomeContainer & CommonsContainer = {
        return Container()
    }()

}
