import UIKit

extension SongInteractiveView {

    func update(mode: SongMode, animated: Bool) {
        switch mode {
        case .picking(let picking):
            songView.setPlayable(false, animated: false)
            setPlaying(false, animated: false)
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
                setPlaying(false, animated: false)
            case .playing:
                setSelected(true, animated: false)
                songView.setPlayable(true, animated: true)
                setPlaying(true, animated: true)
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

    private func setPlaying(_ isPlaying: Bool,
                            animated: Bool,
                            animator: Animating = Animator()) {
        let heightDifference = SongInteractiveView.playingHeight - SongInteractiveView.playableHeight
        let bottomOffset: CGFloat = isPlaying ? heightDifference : 0
        animator.animate(duration: animated ? 0.3 : 0,
                         delay: animated ? 0.3 : 0,
                         animations: {
                                self.bottomInteractiveConstraint?.constant = bottomOffset
                                self.layoutIfNeeded()
                                self.soundImageView.alpha = isPlaying ? 1 : 0
                                self.songView.timeLabel.alpha = isPlaying ? 0 : 1
                         }
        )
    }

}
