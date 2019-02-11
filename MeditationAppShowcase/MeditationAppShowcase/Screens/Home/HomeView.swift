import UIKit

class HomeView: GradientView {

    init() {
        super.init(style: GradientStyle(colors: [GradientColor(location: 0.0, color: UIColor(rgb: 0xFBFCFC)),
                                                 GradientColor(location: 1.0, color: UIColor(rgb: 0xF3F5F6))],
                                        direction: .vertical))
        addSubviews()
        setupLayout()
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let helloLabel = SubviewFactory.helloLabel()
    let backgroundRipImageView = SubviewFactory.imageView()
    let ripImageView = SubviewFactory.imageView()
    let boardView = SubviewFactory.homeBoardView()
    let actionButton = SubviewFactory.actionButton()

    // MARK: - Privates

    private func addSubviews() {
        addSubview(helloLabel)
        addSubview(backgroundRipImageView)
        addSubview(ripImageView)
        addSubview(boardView)
        addSubview(actionButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ripImageView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor),
            ripImageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 40),
            ripImageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75),
            ripImageView.heightAnchor.constraint(equalTo: ripImageView.widthAnchor),
            ripImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundRipImageView.widthAnchor.constraint(equalTo: ripImageView.widthAnchor),
            backgroundRipImageView.heightAnchor.constraint(equalTo: ripImageView.heightAnchor),
            backgroundRipImageView.centerXAnchor.constraint(equalTo: ripImageView.centerXAnchor),
            backgroundRipImageView.bottomAnchor.constraint(equalTo: ripImageView.bottomAnchor, constant: -40),
            boardView.topAnchor.constraint(equalTo: centerYAnchor, constant: 46),
            boardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            boardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: boardView.bottomAnchor, constant: -28)
        ])
    }

    private func configureSubviews() {
        let shadow = SketchShadow(color: .gray, x: 0, y: 2, blur: 4, spread: 0)
        boardView.layer.apply(shadow)
    }

}

private extension HomeView {

    struct SubviewFactory {

        static func helloLabel() -> UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(name: "AvenirNext-Medium", size: 15.0)
            label.textColor = UIColor(rgb: 0x292969)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        static func imageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .center
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

        static func homeBoardView() -> HomeBoardView {
            let homeBoardView = HomeBoardView()
            homeBoardView.translatesAutoresizingMaskIntoConstraints = false
            return homeBoardView
        }

        static func actionButton() -> ActionButton {
            let button = ActionButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

    }

}
