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
    let boardView = HomeBoardView()

    let boardViewTopOffset: CGFloat = 46

    // MARK: - Privates

    private func addSubviews() {
        addSubview(helloLabel)
        addSubview(backgroundRipImageView)
        addSubview(ripImageView)
        addSubview(boardView)
    }

    private func setupLayout() {
        helloLabel.pinTop(to: safeAreaLayoutGuide.topAnchor, offset: 16)
        helloLabel.pinCenterX(to: centerXAnchor)
        ripImageView.pinBottom(to: centerYAnchor, offset: 40)
        ripImageView.pinWidth(to: widthAnchor, multiplier: 0.75)
        ripImageView.pinHeight(to: ripImageView.widthAnchor)
        ripImageView.pinCenterX(to: centerXAnchor)
        backgroundRipImageView.pinWidth(to: ripImageView.widthAnchor)
        backgroundRipImageView.pinHeight(to: ripImageView.heightAnchor)
        backgroundRipImageView.pinCenterX(to: ripImageView.centerXAnchor)
        backgroundRipImageView.pinBottom(to: ripImageView.bottomAnchor, offset: -40)
        boardView.pinTop(to: centerYAnchor, offset: boardViewTopOffset)
        boardView.pinCenterX(to: centerXAnchor)
        boardView.pinWidth(to: widthAnchor, multiplier: 0.9)
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
            return label
        }

        static func imageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .center
            return imageView
        }

    }

}
