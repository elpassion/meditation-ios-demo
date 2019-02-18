import UIKit

class SongView: UIView {

    enum `Mode` {
        case selectable, selected, active
    }

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayut()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let checkBoxView = SubviewFactory.checkBoxView()
    let titleLabel = SubviewFactory.titleLabel()
    let subtitleLabel = SubviewFactory.subtitleLabel()
    let timeLabel = SubviewFactory.timeLabel()

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
        NSLayoutConstraint.activate([
            checkBoxView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBoxView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor,
                                               constant: -2),
            titleLabel.leadingAnchor.constraint(equalTo: checkBoxView.trailingAnchor,
                                                constant: 32),
            subtitleLabel.topAnchor.constraint(equalTo: centerYAnchor,
                                               constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -20)
        ])
    }

}

private extension SongView {

    struct SubviewFactory {

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
