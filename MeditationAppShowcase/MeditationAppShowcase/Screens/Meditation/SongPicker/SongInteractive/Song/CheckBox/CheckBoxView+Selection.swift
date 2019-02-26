extension CheckBoxView {

    func setSelected(_ isSelected: Bool,
                     animated: Bool,
                     animator: Animating = Animator()) {
        animator.animate(duration: animated ? 0.3 : 0,
                         animations: {
                            self.backgroundView.backgroundColor = isSelected ? self.actionColor : .white
        })
    }

}
