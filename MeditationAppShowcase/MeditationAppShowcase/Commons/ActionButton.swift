import UIKit

class ActionButton: UIButton {

    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    func setStyledTitle(_ title: String, animationDuration: TimeInterval = 0.25) {
        let attributedString = NSMutableAttributedString(string: title)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.5
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                            self.setAttributedTitle(attributedString, for: .normal)
                            self.layoutIfNeeded()
                       },
                       completion: nil)
    }

    var tap: (() -> Void)?

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
        addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        clipsToBounds = true
    }

    @objc private func tapAction() {
        tap?()
    }

}
