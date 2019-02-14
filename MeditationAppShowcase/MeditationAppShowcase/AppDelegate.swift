import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appConfigurator = container.appConfigurator()
        appConfigurator.configure(window: window)
        self.window = window
        return true
    }

    // MARK: - Privates

    private lazy var container: HomeContaining & AppConfiguratorContaining = {
        return Container()
    }()

}
