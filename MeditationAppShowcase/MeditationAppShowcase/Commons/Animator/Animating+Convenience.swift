import UIKit

extension Animating {

    func animate(duration: TimeInterval,
                 delay: TimeInterval = 0,
                 options: UIView.AnimationOptions = [],
                 animations: @escaping () -> Void,
                 completion: (() -> Void)? = nil) {
        animate(withDuration: duration,
                delay: delay,
                options: options,
                animations: animations,
                completion: completion)
    }

    func animate(duration: TimeInterval,
                 delay: TimeInterval = 0,
                 usingSpringWithDamping dampingRatio: CGFloat,
                 initialSpringVelocity velocity: CGFloat,
                 options: UIView.AnimationOptions = [],
                 animations: @escaping () -> Void,
                 completion: (() -> Void)? = nil) {
        animate(withDuration: duration,
                delay: delay,
                usingSpringWithDamping: dampingRatio,
                initialSpringVelocity: velocity,
                options: options,
                animations: animations,
                completion: completion)
    }

    func animateKeyframes(duration: TimeInterval,
                          delay: TimeInterval = 0,
                          options: UIView.KeyframeAnimationOptions = [],
                          animations: @escaping () -> Void,
                          completion: (() -> Void)? = nil) {
        animateKeyframes(withDuration: duration,
                         delay: delay,
                         options: options,
                         animations: animations,
                         completion: completion)
    }

}
