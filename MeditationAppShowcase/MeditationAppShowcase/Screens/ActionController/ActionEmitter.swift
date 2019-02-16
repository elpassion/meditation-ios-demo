protocol ActionEmitting {
    func emit(_ data: ActionViewController.Action)
}

protocol ActionHandling {
    func addHandler<U: AnyObject>(target: U,
                                  handler: @escaping (U) -> (ActionViewController.Action) -> Void) -> Disposable
}

class ActionEmitter: EventEmitter<ActionViewController.Action> {}

extension ActionEmitter: ActionEmitting, ActionHandling {}
