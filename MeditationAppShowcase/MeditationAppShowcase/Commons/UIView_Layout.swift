import UIKit

extension UIView {

    func pinEdges(edges: UIEdgeInsets = .zero, to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor,
                             constant: edges.top).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                 constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                  constant: -edges.right).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                constant: -edges.bottom).isActive = true
    }

    // MARK: - Size

    @discardableResult
    func pinHeight(_ height: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinWidth(to widthDimention: NSLayoutDimension,
                  multiplier: CGFloat = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalTo: widthDimention,
                                                multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinHeight(to heightDimention: NSLayoutDimension,
                   multiplier: CGFloat = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalTo: heightDimention,
                                                 multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }

    // MARK: - Sides

    @discardableResult
    func pinTop(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinLeading(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: xAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinTrailing(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                     offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: xAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func pinBottom(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                   offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

    // MARK: - Centers

    @discardableResult
    func pinCenterX(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let contraint = centerXAnchor.constraint(equalTo: xAxis, constant: offset)
        contraint.isActive = true
        return contraint
    }

    @discardableResult
    func pinCenterY(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                    offset: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(equalTo: yAxis, constant: offset)
        constraint.isActive = true
        return constraint
    }

}
