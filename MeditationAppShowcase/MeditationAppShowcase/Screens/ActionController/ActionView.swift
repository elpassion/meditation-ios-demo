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
    let middleControl = ActionControl()
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
        pinHeight(73)
        rewindButton.pinTop(to: middleControl.topAnchor)
        rewindButton.pinLeading(to: leadingAnchor)
        rewindButton.pinTrailing(to: middleControl.leadingAnchor, offset: -distance)
        rewindButton.pinBottom(to: middleControl.bottomAnchor)
        middleControl.pinCenter(to: self)
        playImageView.pinEdges(to: middleControl,
                               edgeInsets: UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0))
        forwardButton.pinTop(to: middleControl.topAnchor)
        forwardButton.pinLeading(to: middleControl.trailingAnchor, offset: distance)
        forwardButton.pinTrailing(to: trailingAnchor)
        forwardButton.pinBottom(to: middleControl.bottomAnchor)
    }

}

private extension ActionView {

    struct SubviewFactory {

        static func rewindButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.setImage(UIImage(named: "back"), for: .normal)
            return button
        }

        static func playImageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .center
            imageView.image = UIImage(named: "play")
            return imageView
        }

        static func forwardButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.setImage(UIImage(named: "next"), for: .normal)
            return button
        }

    }

}
