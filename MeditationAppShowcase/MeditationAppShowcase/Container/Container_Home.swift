import UIKit

protocol HomeContainer {
    func homeViewController() -> UIViewController
}

extension Container: HomeContainer {

    func homeViewController() -> UIViewController {
        return HomeViewController()
    }

}
