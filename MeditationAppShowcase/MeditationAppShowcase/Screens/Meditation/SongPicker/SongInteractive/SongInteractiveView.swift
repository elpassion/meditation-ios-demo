import UIKit

class SongInteractiveView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let interactiveView = SubviewFactory.interactiveView()
    let songView = SubviewFactory.songView()

    let selectedBackgroundColor = UIColor(rgb: 0x6CD1C5)
    let unselectedBackgroundColor = UIColor(rgb: 0xF9FAFB)

    // MARK: - Privates

    private func configureSubviews() {
        let shadow = SketchShadow(color: selectedBackgroundColor,
                                  x: 0, y: 6, blur: 15, spread: 0)
        interactiveView.layer.apply(shadow)
        interactiveView.clipsToBounds = true
        interactiveView.layer.cornerRadius = 3.0
    }

    private func addSubviews() {
        addSubview(interactiveView)
        addSubview(songView)
    }

    private func setupLayout() {
        interactiveView.pinEdges(to: self)
        songView.pinEdges(to: self)
    }

}

private extension SongInteractiveView {

    struct SubviewFactory {

        static func interactiveView() -> UIView {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func songView() -> SongView {
            let songView = SongView()
            songView.translatesAutoresizingMaskIntoConstraints = false
            songView.backgroundColor = .clear
            return songView
        }

    }

}
