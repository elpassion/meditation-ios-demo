protocol SongModeEmitting {
    func emit(_ data: SongMode)
}

protocol SongModeHandling {
    func addHandler<U: AnyObject>(target: U,
                                  handler: @escaping (U) -> (SongMode) -> Void) -> Disposable
}

class SongModeEmitter: EventEmitter<SongMode> {}

extension SongModeEmitter: SongModeEmitting, SongModeHandling {}
