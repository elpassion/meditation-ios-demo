protocol MeditationScreenStateOperating: class {
    func next()
    func previous()
    func repeatCurrentState()
    var stateUpdated: ((MeditationScreenStateOperator.State) -> Void)? { get set }
}

class MeditationScreenStateOperator: MeditationScreenStateOperating {

    enum State {
        case dismiss, picking, listening, finished
    }

    // MARK: - MeditationStateOperating

    func next() {
        currentState = nextState(from: currentState)
    }

    func previous() {
        currentState = previousState(from: currentState)
    }

    func repeatCurrentState() {
        stateUpdated?(currentState)
    }

    var stateUpdated: ((MeditationScreenStateOperator.State) -> Void)?

    // MARK: - Privates

    private var currentState = State.picking {
        didSet {
            stateUpdated?(currentState)
        }
    }

    private func nextState(from state: State) -> State {
        switch state {
        case .dismiss: return .listening
        case .picking: return .listening
        case .listening: return .finished
        case .finished: return .finished
        }
    }

    private func previousState(from state: State) -> State {
        switch state {
        case .dismiss: return .dismiss
        case .picking: return .dismiss
        case .listening: return .picking
        case .finished: return .picking
        }
    }

}
