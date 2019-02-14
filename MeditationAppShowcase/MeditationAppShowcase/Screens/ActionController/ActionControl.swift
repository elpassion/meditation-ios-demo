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
            titleTopConstraint.constant = titleContentInsets.top
            titleLeadingConstraint.constant = titleContentInsets.left
            titleTrailingConstraint.constant = -titleContentInsets.right
            titleBottomConstraint.constant = -titleContentInsets.bottom
            titleLabel.layoutIfNeeded()
        }
    }

    // MARK: - Privates

    private lazy var titleTopConstraint = titleLabel.topAnchor.constraint(equalTo: topAnchor)
    private lazy var titleLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    private lazy var titleTrailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    private lazy var titleBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)

    private func configure() {
        backgroundColor = UIColor(rgb: 0xEA417E)
        clipsToBounds = true
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleTopConstraint,
            titleLeadingConstraint,
            titleTrailingConstraint,
            titleBottomConstraint
        ])
    }

}

private extension ActionControl {

    struct SubviewFactory {

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Bold", size: 13.0)
            label.textColor = .white
            label.contentMode = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

    }

}
