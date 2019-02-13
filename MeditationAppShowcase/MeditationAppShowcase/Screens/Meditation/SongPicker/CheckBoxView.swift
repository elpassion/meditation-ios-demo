import UIKit

class CheckBoxView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 20)
    }

}
