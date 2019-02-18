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

    func pinHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func pinWidth(to widthDimention: NSLayoutDimension, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: widthDimention, multiplier: multiplier).isActive = true
    }

    func pinHeight(to heightDimention: NSLayoutDimension, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: heightDimention, multiplier: multiplier).isActive = true
    }

    // MARK: - Sides

    func pinTop(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: yAxis, constant: offset).isActive = true
    }

    func pinLeading(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: xAxis, constant: offset).isActive = true
    }

    func pinTrailing(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: xAxis, constant: offset).isActive = true
    }

    func pinBottom(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: yAxis, constant: offset).isActive = true
    }

    // MARK: - Centers

    func pinCenterX(to xAxis: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: xAxis, constant: offset).isActive = true
    }

    func pinCenterY(to yAxis: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: yAxis, constant: offset).isActive = true
    }

}
