import UIKit

extension SongViewCell {

    func update(mode: SongMode) {
        update(mode: mode, animated: true)
    }

    func update(mode: SongMode, animated: Bool) {
        interactiveView.update(mode: mode, animated: animated)
        switch mode {
        case .picking(.unselected): setSeparator(isVisible: true)
        default: setSeparator(isVisible: false)
        }
    }

    func setSeparator(isVisible: Bool) {
        separatorView.backgroundColor = isVisible ? UIColor(rgb: 0xD7D7E7) : .clear
    }

    static func height(for mode: SongMode) -> CGFloat {
        switch mode {
        case .picking, .listening(.playable): return 76
        case .listening(.playing): return 110
        case .listening(.hidden): return 0
        }
    }

}
