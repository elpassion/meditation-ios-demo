import UIKit

protocol ActionViewControlling: class {
    var currentMode: ActionViewController.Mode { get set }
    var actionHandler: ActionHandling { get }
//    var actionHandler: EventHandling<ActionViewController.Action> { get }
}

class ActionViewController: UIViewController, ActionViewControlling {

    init(actionEmitter: ActionHandling & ActionEmitter = ActionEmitter()) {
        self.actionEmitter = actionEmitter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func loadView() {
        view = ActionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialState()
        configureButtons()
    }

    var currentMode: Mode = .singleButton(title: "") {
        didSet {
            switch (oldValue, currentMode) {
            case (.singleButton, .singleButton(let title)):
                singleToSingle(title: title)
            case (.singleButton, .player):
                singleButtonToPlayer()
            case (.player, .singleButton(let title)):
                playerToSingleButton(title: title)
            case (.player, .player): ()
            }
        }
    }

    var actionHandler: ActionHandling {
        return actionEmitter
    }

    // MARK: - Privates

    private let actionEmitter: ActionHandling & ActionEmitter //TODO: move to viewModel
    private let animationDuration: TimeInterval = 0.6

    private var actionView: ActionView! {
        return view as? ActionView
    }

    private func configureInitialState() {
        actionView.rewindButton.alpha = 0
        actionView.forwardButton.alpha = 0
    }

    private func configureButtons() {
        actionView.rewindButton.addTarget(self,
                                          action: #selector(rewindButtonAction),
                                          for: .touchUpInside)
        actionView.middleControl.addTarget(self,
                                          action: #selector(middleButtonAction),
                                          for: .touchUpInside)
        actionView.forwardButton.addTarget(self,
                                          action: #selector(forwardButtonAction),
                                          for: .touchUpInside)
    }

    // MARK: - Transformations

    private func singleToSingle(title: String) {
        animate(animations: {
            self.actionView.set(mode: .singleButton(title: title))
            self.actionView.middleControl.layoutIfNeeded()
        })
    }

    private func singleButtonToPlayer() {

        animate(animations: {
            self.actionView.set(mode: .player)
            self.actionView.middleControl.layoutIfNeeded()
        },
        delay: 0)

        let actionButtonCenterX = actionView.middleControl.frame.origin.x +
            actionView.middleControl.frame.size.width / 2
        let rewindButtonCenterX = actionView.rewindButton.frame.origin.x +
            actionView.rewindButton.frame.size.width / 2
        let forwardButtonCenterX = actionView.forwardButton.frame.origin.x +
            actionView.forwardButton.frame.size.width / 2
        let rewindTranslationX = actionButtonCenterX - rewindButtonCenterX
        let forwardTranslationX = actionButtonCenterX - forwardButtonCenterX

        actionView.rewindButton.transform = CGAffineTransform(translationX: rewindTranslationX,
                                                              y: 0)
        actionView.forwardButton.transform = CGAffineTransform(translationX: forwardTranslationX,
                                                               y: 0)
        animate(animations: {
            self.actionView.rewindButton.alpha = 1
            self.actionView.forwardButton.alpha = 1
            self.actionView.rewindButton.transform = .identity
            self.actionView.forwardButton.transform = .identity
        },
        delay: animationDuration)
    }

    private func playerToSingleButton(title: String) {
        actionView.rewindButton.alpha = 0
        actionView.forwardButton.alpha = 0
        animate(animations: {
            self.actionView.set(mode: .singleButton(title: title))
            self.actionView.middleControl.layoutIfNeeded()
        })
    }

    private func animate(animations: @escaping () -> Void,
                         delay: TimeInterval = 0) {
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseInOut, .allowUserInteraction],
                       animations: animations,
                       completion: nil)
    }

    // MARK: - Action Handlers

    @objc private func rewindButtonAction() {
        actionEmitter.emit(.rewind)
    }

    @objc private func forwardButtonAction() {
        actionEmitter.emit(.forward)
    }

    @objc private func middleButtonAction() {
        switch currentMode {
        case .singleButton: actionEmitter.emit(.button)
        case .player: actionEmitter.emit(.play)
        }
    }

}
