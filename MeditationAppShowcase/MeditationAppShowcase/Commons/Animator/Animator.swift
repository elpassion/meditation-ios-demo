import UIKit

protocol Animating {
    func animate(duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions?,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?)
}

class Animator: Animating {

    enum `Type` {
        case linear
        case dynamic(damping: CGFloat, velocity: CGFloat)
    }

    init(type: Type) {
        self.type = type
    }

    // MARK: - Animating

    func animate(duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions?,
                 animations: @escaping () -> Void,
                 completion: (() -> Void)?) {
        switch type {
        case .linear:
            UIView.animate(withDuration: duration,
                           delay: delay,
                           options: options ?? [],
                           animations: animations,
                           completion: { _ in completion?() })
        case .dynamic(let damping, let velocity):
            UIView.animate(withDuration: duration,
                           delay: delay,
                           usingSpringWithDamping: damping,
                           initialSpringVelocity: velocity,
                           options: options ?? [],
                           animations: animations,
                           completion: { _ in completion?() })
        }
    }

    // MARK: - Privates

    private let type: Type

}
