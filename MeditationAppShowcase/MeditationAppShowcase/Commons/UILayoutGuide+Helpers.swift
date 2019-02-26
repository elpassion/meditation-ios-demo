//swiftlint:disable file_length
import UIKit

protocol LayoutGuideCompatible {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UILayoutGuide: LayoutGuideCompatible {}
extension UIView: LayoutGuideCompatible {}

extension LayoutGuideCompatible {

    // MARK: - Size

    @discardableResult
    func pinHeight(_ height: CGFloat) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinWidth(_ width: CGFloat) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
        return constraint
    }

    typealias SizeLayoutConstraints = (
        width: NSLayoutConstraint,
        height: NSLayoutConstraint
    )

    @discardableResult
    func pinSize(_ size: CGSize) -> SizeLayoutConstraints {
        return SizeLayoutConstraints(
            width: pinWidth(size.width),
            height: pinHeight(size.height)
        )
    }

    @discardableResult
    func pinHeight(to height: NSLayoutDimension,
                   multiplier: CGFloat = 1) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = heightAnchor.constraint(equalTo: height,
                                                 multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinWidth(to width: NSLayoutDimension,
                  multiplier: CGFloat = 1) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = widthAnchor.constraint(equalTo: width,
                                                multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    // MARK: - Sides

    @discardableResult
    func pinTop(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = topAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinLeading(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = leadingAnchor.constraint(equalTo: xAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinTrailing(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                     offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = trailingAnchor.constraint(equalTo: xAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinBottom(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                   offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = bottomAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    typealias EdgeLayoutConstraints = (
        top: NSLayoutConstraint,
        leading: NSLayoutConstraint,
        trailing: NSLayoutConstraint,
        bottom: NSLayoutConstraint
    )

    @discardableResult
    func pinEdges(to container: LayoutGuideCompatible,
                  edgeInsets: UIEdgeInsets = .zero) -> EdgeLayoutConstraints {
        return EdgeLayoutConstraints(
            top: pinTop(to: container.topAnchor, offset: edgeInsets.top),
            leading: pinLeading(to: container.leadingAnchor, offset: edgeInsets.left),
            trailing: pinTrailing(to: container.trailingAnchor, offset: -edgeInsets.right),
            bottom: pinBottom(to: container.bottomAnchor, offset: -edgeInsets.bottom)
        )
    }

    // MARK: - Centers

    @discardableResult
    func pinCenterX(to xAxis: NSLayoutXAxisAnchor,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let contraint = centerXAnchor.constraint(equalTo: xAxis, constant: offset)
        contraint.isActive = true
        return contraint
    }

    @discardableResult
    func pinCenterY(to yAxis: NSLayoutYAxisAnchor,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        prepareForSettingConstraints()
        let constraint = centerYAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    typealias CenterLayoutConstraints = (
        centerX: NSLayoutConstraint,
        centerY: NSLayoutConstraint
    )

    @discardableResult
    func pinCenter(to container: LayoutGuideCompatible,
                   offset: CGPoint = .zero) -> CenterLayoutConstraints {
        return CenterLayoutConstraints(
            centerX: pinCenterX(to: container.centerXAnchor),
            centerY: pinCenterY(to: container.centerYAnchor)
        )
    }

    // MARK: -

    func prepareForSettingConstraints() {
        guard let view = self as? UIView else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
    }

}
