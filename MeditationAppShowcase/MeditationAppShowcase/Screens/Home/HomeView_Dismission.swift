import UIKit

extension HomeView {

    func animateDismission(completion: @escaping () -> Void,
                           animator: Animating = Animator()) {
        let dismissionView = UIView(frame: .zero)
        dismissionView.backgroundColor = UIColor(rgb: 0xFAFAFC)
        dismissionView.clipsToBounds = true
        dismissionView.layer.cornerRadius = 10
        addSubview(dismissionView)

        dismissionView.pinTop(to: boardView.topAnchor)
        dismissionView.pinLeading(to: boardView.leadingAnchor)
        dismissionView.pinTrailing(to: boardView.trailingAnchor)
        dismissionView.pinBottom(to: boardView.bottomAnchor)

        dismissionView.layoutIfNeeded()
        let scaled = CGAffineTransform(scaleX: self.frame.width / dismissionView.frame.width,
                                       y: self.frame.height / dismissionView.frame.height)
        let scaledAndTranslated = scaled.translatedBy(x: 0,
                                                      y: -boardViewTopOffset)
        animator.animate(duration: 0.3,
                         animations: { dismissionView.transform = scaledAndTranslated },
                         completion: completion)
    }

}
