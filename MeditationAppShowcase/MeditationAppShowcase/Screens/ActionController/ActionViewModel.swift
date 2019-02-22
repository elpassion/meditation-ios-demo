import Foundation

protocol ActionViewModeling: class {
    func rewindButtonAction()
    func middleButtonAction()
    func forwardButtonAction()
    var currentMode: ((ActionViewController.Mode) -> Void)? { get set }
}

protocol ActionOperating {
    var actionHandler: ActionHandling { get }
    func set(mode: ActionViewController.Mode)
}

class ActionViewModel: ActionViewModeling, ActionOperating {

    init(actionEmitter: ActionHandling & ActionEmitter = ActionEmitter()) {
        self.actionEmitter = actionEmitter
    }

    // MARK: - ActionViewModeling

    func rewindButtonAction() {
        actionEmitter.emit(.rewind)
    }

    func middleButtonAction() {
        switch mode {
        case .singleButton: actionEmitter.emit(.button)
        case .player: actionEmitter.emit(.play)
        }
    }

    func forwardButtonAction() {
        actionEmitter.emit(.forward)
    }

    var currentMode: ((ActionViewController.Mode) -> Void)?

    // MARK: - ActionOperating

    var actionHandler: ActionHandling {
        return actionEmitter
    }

    func set(mode: ActionViewController.Mode) {
        self.mode = mode
        currentMode?(mode)
    }

    // MARK: - Privates

    private let actionEmitter: ActionHandling & ActionEmitter
    private var mode: ActionViewController.Mode = .singleButton(title: "")

}
