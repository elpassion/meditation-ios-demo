import UIKit

extension SongViewCell {

    func updateMode(mode: SongMode) {
        interactiveView.update(mode: mode)
        switch mode {
        case .picking(.unselected): setSeparator(isVisible: true)
        default: setSeparator(isVisible: false)
        }
    }

    func setSeparator(isVisible: Bool) {
        separatorView.backgroundColor = isVisible ? UIColor(rgb: 0xD7D7E7) : .clear
    }

}
