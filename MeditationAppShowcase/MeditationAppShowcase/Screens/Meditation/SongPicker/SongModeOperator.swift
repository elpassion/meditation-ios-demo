protocol SongModeOperating {
    func toListening(from mode: SongMode) -> SongMode
    func toPicking(from mode: SongMode) -> SongMode
}

class SongModeOperator {

    func toListening(from mode: SongMode) -> SongMode {
        switch mode {
        case .picking(let picking):
            switch picking {
            case .selected: return .listening(.playable)
            case .unselected: return .listening(.hidden)
            }
        case .listening: return mode
        }
    }

    func toPicking(from mode: SongMode) -> SongMode {
        switch mode {
        case .listening(let listening):
            switch listening {
            case .playable, .playing: return .picking(.selected)
            case .hidden: return .picking(.unselected)
            }
        case .picking: return mode
        }
    }

}
