import UIKit

protocol HomeViewModeling: class {
    var greeting: ((String) -> Void)? { get set }
    var backgroundRipImage: ((UIImage?) -> Void)? { get set }
    var ripImage: ((UIImage?) -> Void)? { get set }
    var relaxationPercentage: ((String?) -> Void)? { get set }
    var stress: ((String?) -> Void)? { get set }
    var meditate: ((String?) -> Void)? { get set }
    var focus: ((String?) -> Void)? { get set }
    func viewDidLoad()
}

class HomeViewModel: HomeViewModeling {

    // MARK: - HomeViewModeling

    var greeting: ((String) -> Void)?
    var backgroundRipImage: ((UIImage?) -> Void)?
    var ripImage: ((UIImage?) -> Void)?
    var relaxationPercentage: ((String?) -> Void)?
    var stress: ((String?) -> Void)?
    var meditate: ((String?) -> Void)?
    var focus: ((String?) -> Void)?

    func viewDidLoad() {
        greeting?("Hello Ela!")
        backgroundRipImage?(UIImage(named: "rip_background"))
        ripImage?(UIImage(named: "rip"))
        relaxationPercentage?("15%")
        stress?("89%")
        meditate?("5 min")
        focus?("25%")
    }

}
