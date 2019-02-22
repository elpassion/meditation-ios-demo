protocol SongManaging: class {
    var viewModels: [SongViewModeling] { get }
    func select(isSelected: Bool, index: Int)
    func updateToPickingViewModels()
    func updateToListeningViewModels()
    func playNext()
    func playPrevious()
    var didFinishPlaying: (() -> Void)? { get set }
}

class SongManager: SongManaging {

    init(viewModels: [SongViewModeling], songModeOperator: SongModeOperating) {
        self.viewModels = viewModels
        self.songModeOperator = songModeOperator
    }

    let viewModels: [SongViewModeling]

    func select(isSelected: Bool, index: Int) {
        let oldMode = viewModels[index].songMode
        let newMode = songModeOperator.toSelected(isSelected, mode: oldMode)
        viewModels[index].songMode = newMode
    }

    func updateToPickingViewModels() {
        viewModels.forEach { [unowned self] viewModel in
            let oldMode = viewModel.songMode
            let newMode = self.songModeOperator.toPicking(from: oldMode)
            viewModel.songMode = newMode
        }
    }

    func updateToListeningViewModels() {
        viewModels.forEach { [unowned self] viewModel in
            let oldMode = viewModel.songMode
            let newMode = self.songModeOperator.toListening(from: oldMode)
            viewModel.songMode = newMode
        }
        playFirst()
    }

    func playNext() {
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

    func playPrevious() {
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

    private let songModeOperator: SongModeOperating

    private func playFirst() {
        let playables = viewModels.filter { $0.songMode == .listening(.playable) }
        if let firstPlayable = playables.first {
            firstPlayable.songMode = .listening(.playing)
        }
    }

}
