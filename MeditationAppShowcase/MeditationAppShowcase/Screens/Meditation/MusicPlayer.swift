protocol MusicPlaying: class {
    func select(isSelected: Bool, index: Int, viewModels: [SongViewModeling])
    func updateToSongPicking(viewModels: [SongViewModeling])
    func updateToSongListening(viewModels: [SongViewModeling])
    func playNext(viewModels: [SongViewModeling])
    func playPrevious(viewModels: [SongViewModeling])
    var didFinishPlaying: (() -> Void)? { get set }
}

class MusicPlayer: MusicPlaying {

    func select(isSelected: Bool, index: Int, viewModels: [SongViewModeling]) {
        switch viewModels[index].songMode {
        case .picking:
            let oldMode = viewModels[index].songMode
            let newMode = toSelected(isSelected, mode: oldMode)
            viewModels[index].songMode = newMode
        case .listening(.playable):
            viewModels
                .filter { $0.songMode == .listening(.playing) }
                .forEach { $0.songMode = .listening(.playable) }
            viewModels[index].songMode = .listening(.playing)
        case .listening(.playing), .listening(.hidden): ()
        }
    }

    func updateToSongPicking(viewModels: [SongViewModeling]) {
        viewModels
            .filter { $0.songMode == .listening(.playing) || $0.songMode == .listening(.playable) }
            .forEach { $0.songMode = .picking(.selected) }

        viewModels
            .filter { $0.songMode == .listening(.hidden) }
            .forEach { $0.songMode = .picking(.unselected) }
    }

    func updateToSongListening(viewModels: [SongViewModeling]) {
        let selected = viewModels.filter { $0.songMode == .picking(.selected) }
        for (index, viewModel) in selected.enumerated() {
            viewModel.songMode = index == 0 ? .listening(.playing) : .listening(.playable)
        }
        let unselected = viewModels.filter { $0.songMode == .picking(.unselected) }
        unselected.forEach { $0.songMode = .listening(.hidden) }
    }

    func playNext(viewModels: [SongViewModeling]) {
        let playables = viewModels.filter {
            $0.songMode == .listening(.playable) || $0.songMode == .listening(.playing)
        }
        if let index = playables.firstIndex(where: { $0.songMode == .listening(.playing) }),
            index + 1 < playables.count {
            playables[index].songMode = .listening(.playable)
            playables[index + 1].songMode = .listening(.playing)
        } else {
            didFinishPlaying?()
        }
    }

    func playPrevious(viewModels: [SongViewModeling]) {
        let playables = viewModels.filter {
            $0.songMode == .listening(.playable) || $0.songMode == .listening(.playing)
        }
        if let index = playables.firstIndex(where: { $0.songMode == .listening(.playing) }),
            index - 1 >= 0 {
            playables[index].songMode = .listening(.playable)
            playables[index - 1].songMode = .listening(.playing)
        }
    }

    var didFinishPlaying: (() -> Void)?

    // MARK: - Privates

    private func toSelected(_ isSelected: Bool, mode: SongMode) -> SongMode {
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
