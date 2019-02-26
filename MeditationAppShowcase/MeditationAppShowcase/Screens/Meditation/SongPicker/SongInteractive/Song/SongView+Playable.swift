extension SongView {

    func setPlayable(_ isPlayable: Bool,
                     animated: Bool,
                     animator: Animating = Animator()) {
        let titleLabelOffset = isPlayable ? labelPlayableOffset : labelSelectableOffset
        animator.animate(duration: animated ? 0.2 : 0,
                         delay: animated ? 1.03 : 0,
                         animations: {
                                self.titleLabelLeadingConstraint?.constant = titleLabelOffset
                                self.layoutIfNeeded()
                         }
        )

        animator.animate(duration: animated ? 0.2 : 0,
                         delay: animated ? 1.0 : 0,
                         animations: {
                                self.subtitleLabelLeadingConstraint?.constant = titleLabelOffset
                                self.layoutIfNeeded()
                         }
        )

        animator.animate(duration: 0.05,
                         delay: 0,
                         animations: { self.checkBoxView.alpha = isPlayable ? 0 : 1 })
    }

}
