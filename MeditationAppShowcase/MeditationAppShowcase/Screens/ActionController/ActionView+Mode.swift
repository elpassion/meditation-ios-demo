import UIKit

extension ActionView {

    func set(mode: ActionViewController.Mode) {
        switch mode {
        case .singleButton(let title):
            playImageView.alpha = 0
            middleControl.titleLabel.alpha = 1
            middleControl.titleLabel.attributedText = NSAttributedString(buttonTitle: title)
            middleControl.titleContentInsets = UIEdgeInsets(top: 15.5,
                                                            left: 40,
                                                            bottom: 15.5,
                                                            right: 40)
        case .player:
            playImageView.alpha = 1
            middleControl.titleLabel.alpha = 0
            middleControl.titleLabel.attributedText = nil
            middleControl.titleContentInsets = UIEdgeInsets(top: 36.5,
                                                            left: 36.5,
                                                            bottom: 36.5,
                                                            right: 36.5)
        }
    }

}
