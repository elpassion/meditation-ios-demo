import UIKit

class SongPickerViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    func animateAppearance(delay: TimeInterval) {
        containerView.transform = CGAffineTransform(scaleX: 50, y: 0)
        UIView.animate(withDuration: 5.0,
                       delay: delay,
                       options: .curveEaseInOut,
                       animations: { self.containerView.transform = .identity },
                       completion: nil)
    }

    // MARK: - Privates

    private let containerView = UIView(frame: .zero)

    private func addSubviews() {
        containerView.backgroundColor = .blue
        contentView.addSubview(containerView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
