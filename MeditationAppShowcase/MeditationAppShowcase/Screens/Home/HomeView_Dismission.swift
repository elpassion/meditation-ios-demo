import UIKit

extension HomeView {

    func animateDismission(completion: @escaping () -> Void) {
        let dismissionView = UIView(frame: .zero)
        dismissionView.backgroundColor = UIColor(rgb: 0xFAFAFC)
        dismissionView.clipsToBounds = true
        dismissionView.layer.cornerRadius = 10
        dismissionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dismissionView)

        dismissionView.topAnchor.constraint(equalTo: boardView.topAnchor).isActive = true
        dismissionView.leadingAnchor.constraint(equalTo: boardView.leadingAnchor).isActive = true
        dismissionView.trailingAnchor.constraint(equalTo: boardView.trailingAnchor).isActive = true
        dismissionView.bottomAnchor.constraint(equalTo: boardView.bottomAnchor).isActive = true

        dismissionView.layoutIfNeeded()
        let scaled = CGAffineTransform(scaleX: self.frame.width / dismissionView.frame.width,
                                       y: self.frame.height / dismissionView.frame.height)
        let scaledAndTranslated = scaled.translatedBy(x: 0,
                                                      y: -boardViewTopOffset)
        UIView.animate(withDuration: 1.0,
                       animations: { dismissionView.transform = scaledAndTranslated },
                       completion: { _ in completion() })
    }

}
