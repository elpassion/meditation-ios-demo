import UIKit

extension SongView {

    func update(mode: Mode) {
        let selectedLabelColor = UIColor.white
        let unselectedTitleLabelColor = UIColor(rgb: 0x292967)
        let unselectedSubtitleLabelColor = UIColor(rgb: 0x848495)

        switch mode {
        case .selectable:
            titleLabel.textColor = unselectedTitleLabelColor
            subtitleLabel.textColor = unselectedSubtitleLabelColor
            timeLabel.textColor = unselectedSubtitleLabelColor
            checkBoxView.setSelected(true)
        case .selected:
            titleLabel.textColor = selectedLabelColor
            subtitleLabel.textColor = selectedLabelColor
            timeLabel.textColor = selectedLabelColor
            checkBoxView.setSelected(false)
        case .active:()
        }
    }

}
