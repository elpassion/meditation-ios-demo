import UIKit

extension HomeView {

    func animateDismission(completion: @escaping () -> Void) {
        let dismissionView = UIView(frame: .zero)
        dismissionView.backgroundColor = .white
        dismissionView.clipsToBounds = true
        dismissionView.layer.cornerRadius = 10
        dismissionView.translatesAutoresizingMaskIntoConstraints = false
        dismissionView.alpha = 0.3
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
                       delay: 0,
                       options: [],
                       animations: {
                            dismissionView.transform = scaledAndTranslated
                            dismissionView.alpha = 1
                       },
                       completion: { _ in completion() })

    }

}
