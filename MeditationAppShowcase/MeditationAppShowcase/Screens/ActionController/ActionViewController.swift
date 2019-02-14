import UIKit

protocol ActionViewControlling: class {
    var currentMode: ActionViewController.Mode { get set }
    var delegate: ActionViewControllerDelegate? { get set }
}

protocol ActionViewControllerDelegate: class {
    func actionViewControllerDidPerformEvent(_ event: ActionViewController.Event)
}

class ActionViewController: UIViewController, ActionViewControlling {

    init() {
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

    weak var delegate: ActionViewControllerDelegate?

    // MARK: - Privates

    private let animationDuration: TimeInterval = 0.25

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
        actionView.middleButton.addTarget(self,
                                          action: #selector(middleButtonAction),
                                          for: .touchUpInside)
        actionView.forwardButton.addTarget(self,
                                          action: #selector(forwardButtonAction),
                                          for: .touchUpInside)
    }

    // MARK: - Transformations

    private func singleToSingle(title: String) {
        let attributedString = NSAttributedString(buttonTitle: title)
        animate(animations: {
            self.actionView.middleButton.setAttributedTitle(attributedString,
                                                            for: .normal)
            self.actionView.middleButton.layoutIfNeeded()
        })
    }

    private func singleButtonToPlayer() {
        animate(animations: {
            self.actionView.middleButton.setAttributedTitle(NSAttributedString(string: "  "),
                                                            for: .normal)
            self.actionView.middleButton.layoutIfNeeded()
        },
        delay: 0)

        let actionButtonCenterX = actionView.middleButton.frame.origin.x +
            actionView.middleButton.frame.size.width / 2
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
        animate(animations: {
            self.actionView.rewindButton.alpha = 0
            self.actionView.forwardButton.alpha = 0
            self.actionView.middleButton.setAttributedTitle(NSAttributedString(buttonTitle: title),
                                                            for: .normal)
            self.actionView.middleButton.layoutIfNeeded()
        })
    }

    private func animate(animations: @escaping () -> Void,
                         delay: TimeInterval = 0) {
        UIView.animate(withDuration: animationDuration,
                       delay: delay,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseInOut, .allowUserInteraction],
                       animations: animations,
                       completion: nil)
    }

    // MARK: - Action Handlers

    @objc private func rewindButtonAction() {
        delegate?.actionViewControllerDidPerformEvent(.rewind)
    }

    @objc private func forwardButtonAction() {
        delegate?.actionViewControllerDidPerformEvent(.forward)
    }

    @objc private func middleButtonAction() {
        switch currentMode {
        case .singleButton: delegate?.actionViewControllerDidPerformEvent(.button)
        case .player: delegate?.actionViewControllerDidPerformEvent(.play)
        }
    }

}
