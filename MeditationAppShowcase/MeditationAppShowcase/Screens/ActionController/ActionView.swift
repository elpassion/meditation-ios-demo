import UIKit

class ActionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let rewindButton = SubviewFactory.rewindButton()
    let middleControl = SubviewFactory.middleControl()
    let playImageView = SubviewFactory.playImageView()
    let forwardButton = SubviewFactory.forwardButton()

    // MARK: - privates

    private func addSubviews() {
        addSubview(rewindButton)
        addSubview(forwardButton)
        addSubview(middleControl)
        middleControl.addSubview(playImageView)
    }

    private func setupLayout() {
        let distance: CGFloat = 40
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 73),
            rewindButton.topAnchor.constraint(equalTo: middleControl.topAnchor),
            rewindButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            rewindButton.trailingAnchor.constraint(equalTo: middleControl.leadingAnchor,
                                                   constant: -distance),
            rewindButton.bottomAnchor.constraint(equalTo: middleControl.bottomAnchor),
            middleControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleControl.centerYAnchor.constraint(equalTo: centerYAnchor),
            playImageView.topAnchor.constraint(equalTo: middleControl.topAnchor),
            playImageView.leadingAnchor.constraint(equalTo: middleControl.leadingAnchor,
                                                       constant: 6),
            playImageView.trailingAnchor.constraint(equalTo: middleControl.trailingAnchor),
            playImageView.bottomAnchor.constraint(equalTo: middleControl.bottomAnchor),
            forwardButton.topAnchor.constraint(equalTo: middleControl.topAnchor),
            forwardButton.leadingAnchor.constraint(equalTo: middleControl.trailingAnchor,
                                                   constant: distance),
            forwardButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            forwardButton.bottomAnchor.constraint(equalTo: middleControl.bottomAnchor)
        ])
    }

}

private extension ActionView {

    struct SubviewFactory {

        static func rewindButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "back"), for: .normal)
            return button
        }

        static func middleControl() -> ActionControl {
            let button = ActionControl()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        static func playImageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .center
            imageView.image = UIImage(named: "play")
            return imageView
        }

        static func forwardButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "next"), for: .normal)
            return button
        }

    }

}
