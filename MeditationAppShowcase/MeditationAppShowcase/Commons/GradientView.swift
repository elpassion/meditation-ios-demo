import UIKit

class GradientView: UIView {

    init(style: GradientStyle) {
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        gradientLayer.colors = style.colors.map { $0.color.cgColor }
        gradientLayer.locations = style.colors.map { NSNumber(value: $0.location) }
        gradientLayer.startPoint = style.direction.startPoint
        gradientLayer.endPoint = style.direction.endPoint
        layer.addSublayer(gradientLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = layer.bounds
    }

    private let gradientLayer = CAGradientLayer()

}

struct GradientStyle {
    let colors: [GradientColor]
    let direction: GradientDirection
}

struct GradientColor {
    let location: Float
    let color: UIColor
}

struct GradientDirection {
    let startPoint: CGPoint
    let endPoint: CGPoint
}

extension GradientDirection {

    static var vertical: GradientDirection {
        return GradientDirection(
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1)
        )
    }

}
