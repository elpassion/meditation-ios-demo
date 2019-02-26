import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        container.appConfigurator().configure()
        return true
    }

    // MARK: - Privates

    private lazy var container: AppConfiguratorContaining = {
        Container()
    }()

}
