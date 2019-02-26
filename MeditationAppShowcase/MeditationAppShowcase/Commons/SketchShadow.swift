import UIKit

struct SketchShadow {
    let color: UIColor?
    let x: CGFloat
    let y: CGFloat
    let blur: CGFloat
    let spread: CGFloat
}

extension CALayer {
    func apply(_ shadow: SketchShadow) {
        shadowColor = shadow.color?.cgColor
        shadowOpacity = 1
        shadowOffset = CGSize(width: shadow.x, height: shadow.y)
        shadowRadius = shadow.blur / 2.0
        if shadow.spread == 0 {
            shadowPath = nil
        } else {
            let dx = -shadow.spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
