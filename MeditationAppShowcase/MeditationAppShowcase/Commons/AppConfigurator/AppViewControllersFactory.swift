import UIKit

struct AppViewControllersFactory {

    let home: () -> UIViewController
    let actionController: () -> UIViewController & ActionViewControlling

}
