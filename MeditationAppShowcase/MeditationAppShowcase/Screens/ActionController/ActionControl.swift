import UIKit

class ActionControl: UIControl {

    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

    let titleLabel = SubviewFactory.titleLabel()

    var titleContentInsets = UIEdgeInsets.zero {
        didSet {
            titleEdgeConstraints?.top.constant = titleContentInsets.top
            titleEdgeConstraints?.leading.constant = titleContentInsets.left
            titleEdgeConstraints?.trailing.constant = -titleContentInsets.right
            titleEdgeConstraints?.bottom.constant = -titleContentInsets.bottom
            titleLabel.layoutIfNeeded()
        }
    }

    // MARK: - Privates

    private var titleEdgeConstraints: EdgeLayoutConstraints?

    private func configure() {
        backgroundColor = UIColor(rgb: 0xEA417E)
        clipsToBounds = true
        addSubview(titleLabel)
        titleEdgeConstraints = titleLabel.pinEdges(to: self)
    }

}

private extension ActionControl {

    struct SubviewFactory {

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Bold", size: 13.0)
            label.textColor = .white
            label.contentMode = .center
            return label
        }

    }

}
