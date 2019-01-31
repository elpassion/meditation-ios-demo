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
        NSLayoutConstraint.activate([
            ripImageView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor),
            ripImageView.bottomAnchor.constraint(equalTo: centerYAnchor),
            ripImageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75),
            ripImageView.heightAnchor.constraint(equalTo: ripImageView.widthAnchor),
            ripImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundRipImageView.widthAnchor.constraint(equalTo: ripImageView.widthAnchor),
            backgroundRipImageView.heightAnchor.constraint(equalTo: ripImageView.heightAnchor),
            backgroundRipImageView.centerXAnchor.constraint(equalTo: ripImageView.centerXAnchor),
            backgroundRipImageView.bottomAnchor.constraint(equalTo: ripImageView.bottomAnchor, constant: -40)
        ])
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
