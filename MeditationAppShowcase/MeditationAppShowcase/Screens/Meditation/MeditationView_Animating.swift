import UIKit

extension MeditationView {

    func prepareAnimations() {
        tableView.alpha = 0
        bottomGradientView.alpha = 0
        navigationView.transform = CGAffineTransform(translationX: 0,
                                                     y: -navigationView.intrinsicContentSize.height)
        tableView.transform = CGAffineTransform(translationX: 0, y: 50)
    }

    func animateAppearance(animator: Animating = Animator()) {
        animator.animate(duration: 0.2,
                         delay: 0.25,
                         options: .curveEaseOut,
                         animations: { self.navigationView.transform = .identity }
        )
        animator.animate(duration: 0.4,
                         delay: 0.25,
                         options: .curveEaseInOut,
                         animations: {
                                self.tableView.transform = .identity
                                self.tableView.alpha = 1
                                self.bottomGradientView.alpha = 1
                         }
        )
    }

}
