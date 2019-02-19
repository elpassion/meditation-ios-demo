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

    private let titleContainer = UIView(frame: .zero)
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

        titleContainer.pinCenterX(to: centerXAnchor)
        titleContainer.pinTop(to: topAnchor, offset: 20)
        titleLabel.pinTop(to: titleContainer.topAnchor)
        titleLabel.pinLeading(to: titleContainer.leadingAnchor)
        titleLabel.pinBottom(to: titleContainer.bottomAnchor)
        titleValueLabel.pinLeading(to: titleLabel.trailingAnchor, offset: 4)
        titleValueLabel.pinTrailing(to: titleContainer.trailingAnchor)
        titleValueLabel.pinTop(to: titleContainer.topAnchor)
        titleValueLabel.pinBottom(to: titleContainer.bottomAnchor)
        gridLayoutGuide.pinWidth(to: widthAnchor, multiplier: 0.6)
        gridLayoutGuide.pinCenterX(to: centerXAnchor)
        stressLabel.pinCenterY(to: centerYAnchor, offset: yLabelOffset)
        stressLabel.pinCenterX(to: gridLayoutGuide.leadingAnchor)
        stressValueLabel.pinCenterX(to: stressLabel.centerXAnchor)
        stressValueLabel.pinTop(to: stressLabel.bottomAnchor, offset: yValueOffset)
        meditateLabel.pinCenterY(to: centerYAnchor, offset: yLabelOffset)
        meditateLabel.pinCenterX(to: centerXAnchor)
        meditateValueLabel.pinCenterX(to: meditateLabel.centerXAnchor)
        meditateValueLabel.pinTop(to: meditateLabel.bottomAnchor, offset: yValueOffset)
        focusLabel.pinCenterY(to: centerYAnchor, offset: yLabelOffset)
        focusLabel.pinCenterX(to: gridLayoutGuide.trailingAnchor)
        focusValueLabel.pinCenterX(to: focusLabel.centerXAnchor)
        focusValueLabel.pinTop(to: focusLabel.bottomAnchor, offset: yValueOffset)
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
            label.font = font
            label.textColor = textColor
            return label
        }

    }

}
