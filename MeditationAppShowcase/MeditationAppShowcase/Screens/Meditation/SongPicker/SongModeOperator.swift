protocol SongModeOperating {
    func toListening(from mode: SongMode) -> SongMode
    func toPicking(from mode: SongMode) -> SongMode
    func toSelected(_ isSelected: Bool, mode: SongMode) -> SongMode
}

class SongModeOperator: SongModeOperating {

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

    func toSelected(_ isSelected: Bool, mode: SongMode) -> SongMode {
        switch mode {
        case .picking(let picking):
            switch picking {
            case .unselected: return .picking(.selected)
            case .selected: return .picking(.unselected)
            }
        case .listening(let listening):
            switch listening {
            case .playable: return .listening(.playing)
            case .playing: return .listening(.playing)
            case .hidden: return .listening(.hidden)
            }
        }
    }

}
