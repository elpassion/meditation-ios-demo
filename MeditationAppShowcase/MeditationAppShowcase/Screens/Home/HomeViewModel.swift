import UIKit

protocol HomeViewModeling {
    var backgroundRipImage: (() -> UIImage?)? { get }
    var ripImage: (() -> UIImage?)? { get }
    func viewDidLoad()
}

class HomeViewModel: HomeViewModeling {

    // MARK: - HomeViewModeling

    var backgroundRipImage: (() -> UIImage?)?

    var ripImage: (() -> UIImage?)?

    func viewDidLoad() {
        backgroundRipImage = { UIImage(named: "rip_background") }
        ripImage = { UIImage(named: "rip") }
    }

}
