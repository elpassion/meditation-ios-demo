import UIKit

extension SongInteractiveView {

    func update(mode: SongMode, animated: Bool) {
        switch mode {
        case .picking(let picking):
            songView.setPlayable(false, animated: false)
            switch picking {
            case .unselected:
                setSelected(false, animated: animated)
            case .selected:
                setSelected(true, animated: animated)
            }
        case .listening(let listening):
            switch listening {
            case .playable:
                setSelected(false, animated: false)
                songView.setPlayable(true, animated: false)
            case .playing:
                songView.setPlayable(true, animated: true)
            case .hidden: ()
            }
        }
        isHidden = mode == .listening(.hidden)
    }

    // MARK: - Privates

    private func setSelected(_ isSelected: Bool,
                             animated: Bool,
                             animator: Animating = Animator()) {
        songView.setSelected(isSelected, animated: animated)
        interactiveView.backgroundColor = isSelected ? selectedBackgroundColor : unselectedBackgroundColor
        if isSelected {
            interactiveView.transform = CGAffineTransform(scaleX: 0, y: 0)
            animator.animate(duration: animated ? 0.3 : 0,
                             animations: { self.interactiveView.transform = .identity })
        }
    }

}
