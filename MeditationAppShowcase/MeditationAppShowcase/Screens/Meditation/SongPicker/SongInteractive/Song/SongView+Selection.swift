import UIKit

extension SongView {

    func setSelected(_ isSelected: Bool, animated: Bool) {
        let selectedLabelColor = UIColor.white
        let unselectedTitleLabelColor = UIColor(rgb: 0x292967)
        let unselectedSubtitleLabelColor = UIColor(rgb: 0x848495)

        titleLabel.textColor = isSelected ? selectedLabelColor : unselectedTitleLabelColor
        subtitleLabel.textColor = isSelected ? selectedLabelColor : unselectedSubtitleLabelColor
        timeLabel.textColor = isSelected ? selectedLabelColor : unselectedSubtitleLabelColor
        checkBoxView.setSelected(isSelected, animated: animated)
    }

}
