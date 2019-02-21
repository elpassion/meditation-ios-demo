import UIKit
//swiftlint:disable function_parameter_count
protocol Animating {
    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?)

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 usingSpringWithDamping dampingRatio: CGFloat,
                 initialSpringVelocity velocity: CGFloat,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?)

    func animateKeyframes(withDuration duration: TimeInterval,
                          delay: TimeInterval,
                          options: UIView.KeyframeAnimationOptions,
                          animations: @escaping () -> Void,
                          completion: (() -> Void)?)
}

class Animator: Animating {

    // MARK: - Animating

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: animations,
                       completion: { _ in completion?() })
    }

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 usingSpringWithDamping dampingRatio: CGFloat,
                 initialSpringVelocity velocity: CGFloat,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: dampingRatio,
                       initialSpringVelocity: velocity,
                       options: options,
                       animations: animations,
                       completion: { _ in completion?() })
    }

    func animateKeyframes(withDuration duration: TimeInterval,
                          delay: TimeInterval,
                          options: UIView.KeyframeAnimationOptions,
                          animations: @escaping () -> Void,
                          completion: (() -> Void)?) {
        UIView.animateKeyframes(withDuration: duration,
                                delay: delay,
                                options: options,
                                animations: animations,
                                completion: { _ in completion?() })
    }

}
