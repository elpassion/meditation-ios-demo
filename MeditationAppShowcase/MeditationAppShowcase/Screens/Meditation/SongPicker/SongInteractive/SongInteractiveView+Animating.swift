import UIKit

extension SongInteractiveView {

    func animateAppearance(delay: TimeInterval,
                           animator: Animating = Animator(),
                           completion: @escaping () -> Void) {
        songView.transform = CGAffineTransform(translationX: 50, y: 0)
        animator.animate(withDuration: 0.3,
                         delay: delay,
                         options: .curveEaseOut,
                         animations: { self.songView.transform = .identity },
                         completion: completion)
    }

}
