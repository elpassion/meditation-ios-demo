extension SongInteractiveView {

    func reset() {
        songView.checkBoxView.setSelected(false)
        songView.titleLabel.text = nil
        songView.subtitleLabel.text = nil
        songView.timeLabel.text = nil
        update(mode: .selectable)
    }

}
