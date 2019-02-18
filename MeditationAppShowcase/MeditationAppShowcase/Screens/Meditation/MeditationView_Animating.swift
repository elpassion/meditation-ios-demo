extension MeditationView {

    func animateAppearance(animator: Animating = Animator()) {
        animator.animate(duration: 0.2,
                         delay: 0.05,
                         options: .curveEaseOut,
                         animations: {
                                self.navigationView.transform = .identity
                                self.tabBarView.transform = .identity
                         }
        )
        animator.animate(duration: 0.3,
                         delay: 0.1,
                         options: .curveEaseInOut,
                         animations: {
                                self.tableView.transform = .identity
                                self.tableView.alpha = 1
                         }
        )
    }

}
