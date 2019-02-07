import UIKit

protocol HomeViewModeling: class {
    var greeting: ((String) -> Void)? { get set }
    var backgroundRipImage: ((UIImage?) -> Void)? { get set }
    var ripImage: ((UIImage?) -> Void)? { get set }
    func viewDidLoad()
}

class HomeViewModel: HomeViewModeling {

    // MARK: - HomeViewModeling

    var greeting: ((String) -> Void)?

    var backgroundRipImage: ((UIImage?) -> Void)?

    var ripImage: ((UIImage?) -> Void)?

    func viewDidLoad() {
        greeting?("Hello Ela!")
        backgroundRipImage?(UIImage(named: "rip_background"))
        ripImage?(UIImage(named: "rip"))
    }

}
