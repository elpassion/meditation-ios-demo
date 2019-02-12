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
        NSLayoutConstraint.activate([
            arrowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowButton.heightAnchor.constraint(equalToConstant: 44),
            arrowButton.widthAnchor.constraint(equalToConstant: 44),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }

}

private extension NavigationView {

    struct SubviewFactory {

        static func arrorButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.setImage(UIImage(named: "backArrow"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Medium", size: 15.0)
            label.textColor = UIColor(rgb: 0x292967)
            label.text = "Meditation"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

    }

}
