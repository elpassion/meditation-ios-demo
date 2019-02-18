import UIKit

extension Animating {

    func animate(duration: TimeInterval = 0,
                 delay: TimeInterval = 0,
                 options: UIView.AnimationOptions? = nil,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)? = nil) {
        animate(duration: duration,
                delay: delay,
                options: options,
                animations: animations,
                completion: completion)
    }

}
