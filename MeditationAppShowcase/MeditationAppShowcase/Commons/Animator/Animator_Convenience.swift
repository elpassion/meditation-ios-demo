import UIKit

extension Animating {
    func animate(duration: TimeInterval,
                 animations: @escaping () -> Void) {
        animate(duration: duration,
                delay: 0,
                options: nil,
                animations: animations,
                completion: nil)
    }
}
