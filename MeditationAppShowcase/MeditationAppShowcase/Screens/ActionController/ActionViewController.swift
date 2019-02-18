import UIKit

class ActionViewController: UIViewController {

    init(viewModel: ActionViewModeling,
         animator: Animating) {
        self.viewModel = viewModel
        self.animator = animator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func loadView() {
        view = ActionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - Privates

    private let viewModel: ActionViewModeling
    private let animator: Animating
    private let animationDuration: TimeInterval = 0.6

    private var actionView: ActionView! {
        return view as? ActionView
    }

    private func configure() {
        actionView.rewindButton.alpha = 0
        actionView.forwardButton.alpha = 0
        actionView.rewindButton.addTarget(self,
                                          action: #selector(rewindButtonAction),
                                          for: .touchUpInside)
        actionView.middleControl.addTarget(self,
                                          action: #selector(middleButtonAction),
                                          for: .touchUpInside)
        actionView.forwardButton.addTarget(self,
                                          action: #selector(forwardButtonAction),
                                          for: .touchUpInside)
        viewModel.currentMode = { [weak self] in self?.mode = $0 }
    }

    // MARK: - Button action handlers

    @objc private func rewindButtonAction() {
        viewModel.rewindButtonAction()
    }

    @objc private func middleButtonAction() {
        viewModel.middleButtonAction()
    }

    @objc private func forwardButtonAction() {
        viewModel.forwardButtonAction()
    }

    // MARK: - Mode transformations

    private var mode: Mode = .singleButton(title: "") {
        didSet {
            switch (oldValue, mode) {
            case (.singleButton, .singleButton(let title)):
                singleButtonToSingleButton(title: title)
            case (.singleButton, .player):
                singleButtonToPlayer()
            case (.player, .singleButton(let title)):
                playerToSingleButton(title: title)
            case (.player, .player): ()
            }
        }
    }

    private func singleButtonToSingleButton(title: String) {
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
        animator.animate(duration: animationDuration,
                         delay: delay,
                         usingSpringWithDamping: 0.6,
                         initialSpringVelocity: 0.5,
                         options: [.curveEaseInOut, .allowUserInteraction],
                         animations: animations)
    }

}
