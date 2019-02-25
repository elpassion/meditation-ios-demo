import UIKit

class SongInteractiveView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let interactiveView = UIView(frame: .zero)
    let songView = SongView()
    let soundImageView = UIImageView(frame: .zero)

    let selectedBackgroundColor = UIColor(rgb: 0x6CD1C5)
    let unselectedBackgroundColor = UIColor(rgb: 0xF9FAFB)

    private(set) var bottomInteractiveConstraint: NSLayoutConstraint?

    // MARK: - Privates

    private func configureSubviews() {
        let shadow = SketchShadow(color: selectedBackgroundColor,
                                  x: 0, y: 6, blur: 15, spread: 0)
        interactiveView.layer.apply(shadow)
        interactiveView.clipsToBounds = true
        interactiveView.layer.cornerRadius = 3.0
        songView.backgroundColor = .clear
        soundImageView.image = UIImage(named: "sound")
        soundImageView.contentMode = .scaleToFill
        soundImageView.alpha = 0
    }

    private func addSubviews() {
        addSubview(interactiveView)
        addSubview(songView)
        addSubview(soundImageView)
    }

    private func setupLayout() {
        let edgeConstraints = interactiveView.pinEdges(
            to: self, edgeInsets: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 16))
        bottomInteractiveConstraint = edgeConstraints.bottom
        songView.pinEdges(to: self,
                          edgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16))
        soundImageView.pinTop(to: songView.subtitleLabel.bottomAnchor, offset: 10)
        soundImageView.pinLeading(to: songView.titleLabel.leadingAnchor)
        soundImageView.pinTrailing(to: songView.timeLabel.trailingAnchor)
    }

}
