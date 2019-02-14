import UIKit

class ActionButton: UIButton {

    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

    // MARK: - Privates

    private func configure() {
        backgroundColor = UIColor(rgb: 0xEA417E)
        titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 13.0)
        titleLabel?.textColor = .white
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 40, bottom: 16, right: 40)
        clipsToBounds = true
    }

}
