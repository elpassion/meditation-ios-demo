import UIKit

class SongPickerViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        titleLabel.textColor = selected ? selectedLabelColor : unselectedTitleLabelColor
        subtitleLabel.textColor = selected ? selectedLabelColor : unselectedSubtitleLabelColor
        selectionView.backgroundColor = selected ? selectedBackgroundColor : unselectedBackgroundColor
        timeLabel.textColor = selected ? selectedLabelColor : unselectedSubtitleLabelColor
        checkBoxView.setSelected(selected)
        if selected {
            selectionView.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.3) { self.selectionView.transform = .identity }
        }
    }

    func animateAppearance(delay: TimeInterval) {
        guard !didPerformAppearanceAnimation else { return }
        containerView.transform = CGAffineTransform(translationX: 50, y: 0)
        UIView.animate(withDuration: 0.3,
                       delay: delay,
                       options: .curveEaseOut,
                       animations: { self.containerView.transform = .identity },
                       completion: { _ in self.didPerformAppearanceAnimation = true })
    }

    let titleLabel = SubviewFactory.titleLabel()
    let subtitleLabel = SubviewFactory.subtitleLabel()
    let timeLabel = SubviewFactory.timeLabel()

    // MARK: - Privates

    private let containerView = SubviewFactory.view()
    private let selectionView = SubviewFactory.view()
    private let separatorView = SubviewFactory.separatorView()
    private let checkBoxView = SubviewFactory.checkBoxView()
    private let selectedBackgroundColor = UIColor(rgb: 0x6CD1C5)
    private let unselectedBackgroundColor = UIColor(rgb: 0xF9FAFB)
    private let selectedLabelColor = UIColor.white
    private let unselectedTitleLabelColor = UIColor(rgb: 0x292967)
    private let unselectedSubtitleLabelColor = UIColor(rgb: 0x848495)
    private var didPerformAppearanceAnimation = false

    private func configureSubviews() {
        selectionStyle = .none
        checkBoxView.clipsToBounds = true
        checkBoxView.layer.cornerRadius = 4.0
        selectionView.clipsToBounds = true
        selectionView.layer.cornerRadius = 3.0
        let shadow = SketchShadow(color: selectedBackgroundColor, x: 0, y: 6, blur: 15, spread: 0)
        selectionView.layer.apply(shadow)
        setSelected(false, animated: false)
    }

    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(separatorView)
        containerView.addSubview(selectionView)
        containerView.addSubview(checkBoxView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(timeLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: 1),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                  constant: -1),
            containerView.heightAnchor.constraint(equalToConstant: 76),
            separatorView.leadingAnchor.constraint(equalTo: checkBoxView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            selectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            selectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            selectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            checkBoxView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkBoxView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                  constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor,
                                            constant: -2),
            titleLabel.leadingAnchor.constraint(equalTo: checkBoxView.trailingAnchor,
                                                constant: 32),
            subtitleLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor,
                                               constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                constant: -20)
        ])
    }

}

private extension SongPickerViewCell {

    struct SubviewFactory {

        static func view() -> UIView {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func separatorView() -> UIView {
            let view = self.view()
            view.backgroundColor = UIColor(rgb: 0xD7D7E7)
            return view
        }

        static func checkBoxView() -> CheckBoxView {
            let view = CheckBoxView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func titleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        static func subtitleLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Regular", size: 12.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        static func timeLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-DemiBold", size: 14.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

    }

}
