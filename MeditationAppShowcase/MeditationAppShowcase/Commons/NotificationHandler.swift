import Foundation

protocol NotificationHandling {
    func addObserver(_ observer: Any,
                     selector aSelector: Selector,
                     name aName: NSNotification.Name?,
                     object anObject: Any?)
}

extension NotificationCenter: NotificationHandling {}
