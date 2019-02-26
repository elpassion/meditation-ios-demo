import UIKit

extension NSAttributedString {

    convenience init(buttonTitle: String) {
        let attributedString = NSMutableAttributedString(string: buttonTitle)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.5
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        self.init(attributedString: attributedString)
    }

}
