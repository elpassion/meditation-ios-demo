import UIKit

class TabBarView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayout()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        bringSubviewToFront(bottomView)
        bringSubviewToFront(topContainerView)
    }

    let topContainerView = UIView(frame: .zero)
    let containerLayoutGuide = UILayoutGuide()
    let bottomView = SubviewFactory.bottomView()
    var bottomBarConstraint: NSLayoutConstraint?

    // MARK: - Privates

    private func configureSubviews() {
        let shadow = SketchShadow(color: .gray, x: 0, y: 2, blur: 4, spread: 0)
        bottomView.layer.apply(shadow)
        topContainerView.backgroundColor = .clear
        topContainerView.isUserInteractionEnabled = false
    }

    private func addSubviews() {
        addLayoutGuide(containerLayoutGuide)
        addSubview(bottomView)
        addSubview(topContainerView)
    }

    private func setupLayout() {
        containerLayoutGuide.pinTop(to: safeAreaLayoutGuide.topAnchor)
        containerLayoutGuide.pinLeading(to: safeAreaLayoutGuide.leadingAnchor)
        containerLayoutGuide.pinTrailing(to: safeAreaLayoutGuide.trailingAnchor)
        containerLayoutGuide.pinBottom(to: bottomView.topAnchor)
        bottomView.pinLeading(to: safeAreaLayoutGuide.leadingAnchor)
        bottomView.pinTrailing(to: safeAreaLayoutGuide.trailingAnchor)
        bottomBarConstraint = bottomView.pinBottom(to: safeAreaLayoutGuide.bottomAnchor)
        topContainerView.pinEdges(to: safeAreaLayoutGuide)
    }

}

private extension TabBarView {

    struct SubviewFactory {

        static func bottomView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "tabBar")
            imageView.contentMode = .center
            return imageView
        }

    }

}
