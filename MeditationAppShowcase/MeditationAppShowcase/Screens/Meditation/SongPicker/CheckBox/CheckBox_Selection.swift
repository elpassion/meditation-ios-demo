extension CheckBoxView {

    func setSelected(_ isSelected: Bool, animator: Animating = Animator()) {
        animator.animate(duration: 0.3,
                         animations: {
                            self.backgroundView.backgroundColor = isSelected ? self.actionColor : .white
        })
    }

}
