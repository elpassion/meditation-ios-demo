import UIKit

class NavigationView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0xF9FAFB)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let arrowButton = SubviewFactory.arrorButton()
    let titleLabel = SubviewFactory.titleLabel()

    // MARK: - Privates

    private func addSubviews() {
        addSubview(arrowButton)
        addSubview(titleLabel)
    }

    private func setupLayout() {
        arrowButton.pinLeading(to: leadingAnchor, offset: 4)
        arrowButton.pinCenterY(to: titleLabel.centerYAnchor)
        arrowButton.pinHeight(44)
        arrowButton.pinSize(CGSize(width: 44, height: 44))
        titleLabel.pinCenterX(to: centerXAnchor)
        titleLabel.pinBottom(to: bottomAnchor, offset: -4)
    }

}

private extension NavigationView {

    struct SubviewFactory {

        static func arrorButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.setImage(UIImage(named: "backArrow"), for: .normal)
            return button
        }

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Medium", size: 15.0)
            label.textColor = UIColor(rgb: 0x292967)
            label.text = "Meditation"
            return label
        }

    }

}
