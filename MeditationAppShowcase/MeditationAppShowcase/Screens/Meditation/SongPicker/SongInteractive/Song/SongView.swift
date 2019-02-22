import UIKit

class SongView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayut()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let checkBoxView = CheckBoxView()
    let titleLabel = SubviewFactory.titleLabel()
    let subtitleLabel = SubviewFactory.subtitleLabel()
    let timeLabel = SubviewFactory.timeLabel()

    private(set) var titleLabelLeadingConstraint: NSLayoutConstraint?
    private(set) var subtitleLabelLeadingConstraint: NSLayoutConstraint?
    let labelSelectableOffset: CGFloat = 72
    let labelPlayableOffset: CGFloat = 30

    // MARK: - Privates

    private func configureSubviews() {
        checkBoxView.clipsToBounds = true
        checkBoxView.layer.cornerRadius = 4.0
    }

    private func addSubviews() {
        addSubview(checkBoxView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(timeLabel)
    }

    private func setupLayut() {
        pinHeight(76)
        checkBoxView.pinCenterY(to: centerYAnchor)
        checkBoxView.pinLeading(to: leadingAnchor, offset: 20)
        titleLabelLeadingConstraint = titleLabel.pinLeading(to: leadingAnchor,
                                                            offset: labelSelectableOffset)
        titleLabel.pinBottom(to: centerYAnchor, offset: -2)
        subtitleLabel.pinTop(to: centerYAnchor, offset: 2)
        subtitleLabelLeadingConstraint = subtitleLabel.pinLeading(to: leadingAnchor,
                                                                  offset: labelSelectableOffset)
        timeLabel.pinCenterY(to: centerYAnchor)
        timeLabel.pinTrailing(to: trailingAnchor, offset: -20)
    }

}

private extension SongView {

    struct SubviewFactory {

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
            return label
        }

        static func subtitleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Regular", size: 12.0)
            return label
        }

        static func timeLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
            return label
        }

    }

}
