import UIKit

class HomeBoardView: UIImageView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let titleValueLabel = SubviewFactory.titleValueLabel()
    let stressValueLabel = SubviewFactory.subtitleValueLabel()
    let meditateValueLabel = SubviewFactory.subtitleValueLabel()
    let focusValueLabel = SubviewFactory.subtitleValueLabel()

    // MARK: - Privates

    private let titleContainer = SubviewFactory.titleContainer()
    private let titleLabel = SubviewFactory.titleLabel()
    private let stressLabel = SubviewFactory.subtitleLabel()
    private let meditateLabel = SubviewFactory.subtitleLabel()
    private let focusLabel = SubviewFactory.subtitleLabel()
    private let gridLayoutGuide = UILayoutGuide()

    private func addSubviews() {
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        titleContainer.addSubview(titleValueLabel)
        addLayoutGuide(gridLayoutGuide)
        addSubview(stressLabel)
        addSubview(stressValueLabel)
        addSubview(meditateLabel)
        addSubview(meditateValueLabel)
        addSubview(focusLabel)
        addSubview(focusValueLabel)
    }

    private func setupLayout() {
        let yLabelOffset: CGFloat = -8
        let yValueOffset: CGFloat = 2
        NSLayoutConstraint.activate([
            titleContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            titleValueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            titleValueLabel.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            titleValueLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            titleValueLabel.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            gridLayoutGuide.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            gridLayoutGuide.centerXAnchor.constraint(equalTo: centerXAnchor),
            stressLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yLabelOffset),
            stressLabel.centerXAnchor.constraint(equalTo: gridLayoutGuide.leadingAnchor),
            stressValueLabel.centerXAnchor.constraint(equalTo: stressLabel.centerXAnchor),
            stressValueLabel.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: yValueOffset),
            meditateLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yLabelOffset),
            meditateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            meditateValueLabel.centerXAnchor.constraint(equalTo: meditateLabel.centerXAnchor),
            meditateValueLabel.topAnchor.constraint(equalTo: meditateLabel.bottomAnchor, constant: yValueOffset),
            focusLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yLabelOffset),
            focusLabel.centerXAnchor.constraint(equalTo: gridLayoutGuide.trailingAnchor),
            focusValueLabel.centerXAnchor.constraint(equalTo: focusLabel.centerXAnchor),
            focusValueLabel.topAnchor.constraint(equalTo: focusLabel.bottomAnchor, constant: yValueOffset)
        ])
    }

    private func configureSubviews() {
        image = UIImage(named: "home_board")
        contentMode = .center
        titleLabel.text = "Relaxation Level:"
        stressLabel.text = "Stress:"
        meditateLabel.text = "Meditate:"
        focusLabel.text = "Focus:"
    }

}

private extension HomeBoardView {

    struct SubviewFactory {

        static func titleContainer() -> UIView {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func titleLabel() -> UILabel {
            return label(textColor: UIColor(rgb: 0x292967),
                         font: UIFont(name: "AvenirNext-Regular", size: 22.0))
        }

        static func titleValueLabel() -> UILabel {
            return label(textColor: UIColor(rgb: 0xE94680),
                         font: UIFont(name: "AvenirNext-Regular", size: 22.0))
        }

        static func subtitleLabel() -> UILabel {
            return label(textColor: UIColor(rgb: 0x848495),
                         font: UIFont(name: "AvenirNext-Regular", size: 14.0))
        }

        static func subtitleValueLabel() -> UILabel {
            return label(textColor: UIColor(rgb: 0x292967),
                         font: UIFont(name: "AvenirNext-DemiBold", size: 14.0))
        }

        private static func label(textColor: UIColor?, font: UIFont?) -> UILabel {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = font
            label.textColor = textColor
            return label
        }

    }

}
