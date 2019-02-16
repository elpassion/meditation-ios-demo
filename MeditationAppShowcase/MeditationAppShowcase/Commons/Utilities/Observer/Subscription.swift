class Subscription<T: AnyObject, U> : Invocable, Disposable {

    weak var target: T?
    let handler: (T) -> (U) -> Void
    let event: EventEmitter<U>

    init(target: T?, handler: @escaping (T) -> (U) -> Void, event: EventEmitter<U>) {
        self.target = target
        self.handler = handler
        self.event = event
    }

    func invoke(_ data: Any) {
        guard let target = target, let data = data as? U else { return }
        handler(target)(data)
    }

    func dispose() {
        event.eventHandlers = event.eventHandlers.filter { $0 as AnyObject? !== self }
    }
}
