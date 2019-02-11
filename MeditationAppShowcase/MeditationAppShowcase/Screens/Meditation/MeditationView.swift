import UIKit

class MeditationView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let navigationView = SubviewFactory.navigationView()
    let tabBarView = SubviewFactory.tabBarView()

    func animateAppearance() {

    }

    // MARK: - Privates

    private let navigationViewAnimationLayoutGuide = UILayoutGuide()

    private func addSubviews() {
        addSubview(navigationView)
        addSubview(tabBarView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            navigationView.heightAnchor.constraint(equalToConstant: 44.0),
            navigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            navigationViewAnimationLayoutGuide.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        ])
    }

}

private extension MeditationView {

    struct SubviewFactory {

        static func navigationView() -> UIView {
            let view = UIView(frame: .zero)
            view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func tabBarView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.backgroundColor = .blue
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

    }

}
