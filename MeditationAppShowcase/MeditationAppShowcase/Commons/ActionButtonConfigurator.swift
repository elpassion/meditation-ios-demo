import UIKit

protocol ActionButtonConfiguring {
    func configure(actionButton: ActionButton, with window: UIWindow)
}

protocol ActionButtonOperating {
    var button: ButtonInteracting? { get }
    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool)
}

class ActionButtonConfigurator: ActionButtonConfiguring, ActionButtonOperating {

    // MARK: - ActionButtonConfiguring

    func configure(actionButton: ActionButton, with window: UIWindow) {
        self.actionButton = actionButton
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(actionButton)

        let centerX = actionButton.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        let bottomConstraint = actionButton.bottomAnchor.constraint(equalTo: window.bottomAnchor)

        NSLayoutConstraint.activate([centerX, bottomConstraint])
        actionButtomBottomConstraint = bottomConstraint
    }

    // MARK: - ActionButtonOperating

    weak var button: ButtonInteracting? {
        return actionButton
    }

    func updateBottomOffset(_ bottomOffset: CGFloat, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.25 : 0) {
            self.actionButtomBottomConstraint?.constant = -bottomOffset
            self.actionButton?.layoutIfNeeded()
        }
    }

    // MARK: - Privates

    private weak var actionButton: ActionButton?
    private var actionButtomBottomConstraint: NSLayoutConstraint?

}
