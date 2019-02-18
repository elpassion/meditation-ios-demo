class EventEmitter<T> {

    typealias EventHandler = (T) -> Void
    var eventHandlers = [Invocable]()

    func emit(_ data: T) {
        for handler in eventHandlers {
            handler.invoke(data)
        }
    }

    func addHandler<U: AnyObject>(target: U,
                                  handler: @escaping (U) -> EventHandler) -> Disposable {
        let subscription = Subscription(target: target,
                                        handler: handler,
                                        event: self)
        eventHandlers.append(subscription)
        return subscription
    }

}
