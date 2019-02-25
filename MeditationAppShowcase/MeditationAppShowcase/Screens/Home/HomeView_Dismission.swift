import UIKit

extension HomeView {

    func animateDismission(completion: @escaping () -> Void,
                           animator: Animating = Animator()) {
        let dismissionView = UIView(frame: .zero)
        dismissionView.backgroundColor = UIColor(rgb: 0xFAFAFC)
        dismissionView.clipsToBounds = true
        dismissionView.layer.cornerRadius = 10
        addSubview(dismissionView)
        dismissionView.pinEdges(to: boardView)
        dismissionView.layoutIfNeeded()

        let scaled = CGAffineTransform(scaleX: frame.width / dismissionView.frame.width,
                                       y: frame.height / dismissionView.frame.height)
        let scaledAndTranslated = scaled.translatedBy(x: 0,
                                                      y: -boardViewTopOffset)
        animator.animate(duration: 0.3,
                         animations: { dismissionView.transform = scaledAndTranslated },
                         completion: completion)

        animator.animate(duration: 0,
                         delay: 1.0,
                         animations: { dismissionView.transform = .identity },
                         completion: { dismissionView.removeFromSuperview() })
    }

}
