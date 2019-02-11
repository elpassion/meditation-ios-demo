import UIKit

protocol HomeViewModeling: class {
    func viewDidLoad()
    var greeting: ((String) -> Void)? { get set }
    var backgroundRipImage: ((UIImage?) -> Void)? { get set }
    var ripImage: ((UIImage?) -> Void)? { get set }
    var relaxationPercentage: ((String) -> Void)? { get set }
    var stress: ((String) -> Void)? { get set }
    var meditate: ((String) -> Void)? { get set }
    var focus: ((String) -> Void)? { get set }
    var actionTitle: ((String) -> Void)? { get set }
    func action()
}

class HomeViewModel: HomeViewModeling {

    // MARK: - HomeViewModeling

    func viewDidLoad() {
        greeting?("Hello Ela!")
        backgroundRipImage?(UIImage(named: "rip_background"))
        ripImage?(UIImage(named: "rip"))
        relaxationPercentage?("15%")
        stress?("89%")
        meditate?("5 min")
        focus?("25%")
        actionTitle?("COME BACK TO LIFE")
    }

    var greeting: ((String) -> Void)?
    var backgroundRipImage: ((UIImage?) -> Void)?
    var ripImage: ((UIImage?) -> Void)?
    var relaxationPercentage: ((String) -> Void)?
    var stress: ((String) -> Void)?
    var meditate: ((String) -> Void)?
    var focus: ((String) -> Void)?
    var actionTitle: ((String) -> Void)?

    func action() {
        actionTitle?("START MEDITATION SESSION")
    }

}
