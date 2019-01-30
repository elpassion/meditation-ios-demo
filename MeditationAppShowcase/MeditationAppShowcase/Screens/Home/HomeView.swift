import UIKit

class HomeView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let backgroundRipImageView = SubviewFactory.imageView()
    let ripImageView = SubviewFactory.imageView()

    // MARK: - Privates

    private func addSubviews() {
        addSubview(backgroundRipImageView)
        addSubview(ripImageView)
    }

    private func setupLayout() {
        [backgroundRipImageView, ripImageView].forEach { subview in
            NSLayoutConstraint.activate([
                subview.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor),
                subview.bottomAnchor.constraint(equalTo: centerYAnchor),
                subview.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75),
                subview.heightAnchor.constraint(equalTo: subview.heightAnchor),
                subview.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        }
    }

}

private extension HomeView {

    struct SubviewFactory {

        static func imageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .center
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

    }

}
