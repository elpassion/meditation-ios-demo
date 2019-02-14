import UIKit

class ActionView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let rewindButton = SubviewFactory.rewindButton()
    let middleButton = SubviewFactory.middleButton()
    let forwardButton = SubviewFactory.forwardButton()

    // MARK: - privates

    private func addSubviews() {
        addSubview(rewindButton)
        addSubview(middleButton)
        addSubview(forwardButton)
    }

    private func setupLayout() {
        let distance: CGFloat = 40
        NSLayoutConstraint.activate([
            rewindButton.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor),
            rewindButton.trailingAnchor.constraint(equalTo: middleButton.leadingAnchor,
                                                   constant: -distance),
            middleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: topAnchor),
            middleButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            forwardButton.leadingAnchor.constraint(equalTo: middleButton.trailingAnchor,
                                                   constant: distance)
        ])
    }

}

private extension ActionView {

    struct SubviewFactory {

        static func rewindButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("<<", for: .normal)
            return button
        }

        static func middleButton() -> ActionButton {
            let button = ActionButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        static func forwardButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(">>", for: .normal)
            return button
        }

    }

}
