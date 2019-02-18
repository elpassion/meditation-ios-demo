import UIKit

protocol HomeViewModeling: class {
    func viewDidLoad()
    func viewDidAppear()
    func viewWillDisappear()
    var greeting: ((String) -> Void)? { get set }
    var backgroundRipImage: ((UIImage?) -> Void)? { get set }
    var ripImage: ((UIImage?) -> Void)? { get set }
    var relaxationPercentage: ((String) -> Void)? { get set }
    var stress: ((String) -> Void)? { get set }
    var meditate: ((String) -> Void)? { get set }
    var focus: ((String) -> Void)? { get set }
    var presentMeditation: (() -> Void)? { get set }
}

class HomeViewModel: HomeViewModeling {

    init(actionOperator: ActionOperating) {
        self.actionOperator = actionOperator
    }

    // MARK: - HomeViewModeling

    func viewDidLoad() {
        greeting?("Hello Ela!")
        backgroundRipImage?(UIImage(named: "rip_background"))
        ripImage?(UIImage(named: "rip"))
        relaxationPercentage?("15%")
        stress?("89%")
        meditate?("5 min")
        focus?("25%")
    }

    func viewDidAppear() {
        actionOperator.set(mode: .singleButton(title: "COME BACK TO LIFE"))
        disposable = actionOperator.actionHandler.addHandler(
            target: self,
            handler: HomeViewModel.handleAction)
    }

    func viewWillDisappear() {
        disposable?.dispose()
    }

    var greeting: ((String) -> Void)?
    var backgroundRipImage: ((UIImage?) -> Void)?
    var ripImage: ((UIImage?) -> Void)?
    var relaxationPercentage: ((String) -> Void)?
    var stress: ((String) -> Void)?
    var meditate: ((String) -> Void)?
    var focus: ((String) -> Void)?
    var presentMeditation: (() -> Void)?

    // MARK: - Privates

    private let actionOperator: ActionOperating
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        actionOperator.set(mode: .singleButton(title: "START MEDITATION SESSION"))
        presentMeditation?()
    }

}
