import UIKit

protocol ButtonInteracting: class {
    func setStyledTitle(_ title: String, animationDuration: TimeInterval?)
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
    func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event)
}

class ActionButton: UIButton, ButtonInteracting {

    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

    // MARK: - ButtonInteracting

    func setStyledTitle(_ title: String, animationDuration: TimeInterval?) {
        let attributedString = NSMutableAttributedString(string: title)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.5
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        UIView.animate(withDuration: animationDuration ?? 0,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                            self.setAttributedTitle(attributedString, for: .normal)
                            self.layoutIfNeeded()
                       },
                       completion: nil)
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
