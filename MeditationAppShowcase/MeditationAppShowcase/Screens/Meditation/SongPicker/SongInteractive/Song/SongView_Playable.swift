extension SongView {

    func setPlayable(_ isPlayable: Bool, animator: Animating = Animator()) {
        let titleLabelOffset = isPlayable ? labelPlayableOffset : labelSelectableOffset
        animator.animate(duration: 0.2,
                         delay: 0.03,
                         animations: {
                                self.titleLabelLeadingConstraint?.constant = titleLabelOffset
                                self.layoutIfNeeded()
                         }
        )

        animator.animate(duration: 0.2,
                         animations: {
                                self.checkBoxView.alpha = isPlayable ? 0 : 1
                                self.subtitleLabelLeadingConstraint?.constant = titleLabelOffset
                                self.layoutIfNeeded()
                         }
        )
    }

}
