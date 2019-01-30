import UIKit

protocol HomeViewModeling: class {
    var backgroundRipImage: ((UIImage?) -> Void)? { get set }
    var ripImage: ((UIImage?) -> Void)? { get set }
    func viewDidLoad()
}

class HomeViewModel: HomeViewModeling {

    // MARK: - HomeViewModeling

    var backgroundRipImage: ((UIImage?) -> Void)?

    var ripImage: ((UIImage?) -> Void)?

    func viewDidLoad() {
        backgroundRipImage?(UIImage(named: "rip_background"))
        ripImage?(UIImage(named: "rip"))
    }

}
