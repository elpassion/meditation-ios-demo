import UIKit

class CheckBoxView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 20)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = layer.cornerRadius
    }

    let backgroundView = UIView(frame: .zero)
    let tickImageView = SubviewFactory.tickImageView()
    let actionColor = UIColor(rgb: 0x28286B)

    // MARK: - Privates

    private func configureSubviews() {
        backgroundColor = actionColor
        addSubview(backgroundView)
        backgroundView.addSubview(tickImageView)
        backgroundView.clipsToBounds = true
        backgroundView.pinEdges(edges: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1),
                                to: self)
        tickImageView.pinCenterX(to: centerXAnchor)
        tickImageView.pinCenterY(to: bottomAnchor, offset: -4)
    }

}

private extension CheckBoxView {

    struct SubviewFactory {

        static func tickImageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "tick")
            imageView.contentMode = .center
            return imageView
        }

    }

}
