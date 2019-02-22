import UIKit

extension SongInteractiveView {

    func update(mode: SongMode, animator: Animating = Animator()) {
        switch mode {
        case .selectable:
            setSelected(false, animator: animator)
        case .selected:
            setSelected(true, animator: animator)
        case .playable: ()
        case .playing: ()
        case .hidden: ()
        }
    }

    // MARK: - Privates

    private func setSelected(_ isSelected: Bool, animator: Animating) {
        songView.setSelected(isSelected)
        interactiveView.backgroundColor = isSelected ? selectedBackgroundColor : unselectedBackgroundColor
        if isSelected {
            interactiveView.transform = CGAffineTransform(scaleX: 0, y: 0)
            animator.animate(duration: 0.3,
                             animations: { self.interactiveView.transform = .identity })
        }
    }

}
