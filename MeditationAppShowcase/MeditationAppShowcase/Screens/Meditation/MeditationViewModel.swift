protocol MeditationViewModeling: class {
    var latestSongViewModels: (([SongViewModeling]) -> Void)? { get set }
    func didSelect(isSelected: Bool, index: Int)
    func viewDidAppear()
    func viewWillDisappear()
    func backAction()
    var closeMeditation: (() -> Void)? { get set }
}

class MeditationViewModel: MeditationViewModeling {

    init(actionOperator: ActionOperating,
         tabBarOperator: TabBarOperating,
         songManager: SongManaging,
         stateOperator: MeditationStateOperating) {
        self.actionOperator = actionOperator
        self.tabBarOperator = tabBarOperator
        self.songManager = songManager
        self.stateOperator = stateOperator
        configure()
    }

    // MARK: - MeditationViewModeling

    var latestSongViewModels: (([SongViewModeling]) -> Void)?

    func didSelect(isSelected: Bool, index: Int) {
        songManager.select(isSelected: isSelected, index: index)
    }

    func viewDidAppear() {
        latestSongViewModels?(songManager.viewModels)
        disposable = actionOperator.actionHandler.addHandler(
            target: self,
            handler: MeditationViewModel.handleAction)
        tabBarOperator.isBarVisible = true
        stateOperator.repeatCurrentState()
    }

    func viewWillDisappear() {
        disposable?.dispose()
    }

    func backAction() {
        stateOperator.previous()
    }

    // MARK: - MeditationViewOperating

    var closeMeditation: (() -> Void)?

    // MARK: - Privates

    private let actionOperator: ActionOperating
    private let tabBarOperator: TabBarOperating
    private let songManager: SongManaging
    private let stateOperator: MeditationStateOperating
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        switch action {
        case .button:
            stateOperator.next()
        case .rewind:
            songManager.playPrevious()
        case .play:
            print("Play")
        case .forward:
            songManager.playNext()
        }
    }

    private func configure() {
        stateOperator.stateUpdated = { [weak self] state in
            switch state {
            case .dismiss:
                self?.closeMeditation?()
            case .picking:
                self?.actionOperator.set(mode: .singleButton(title: "START MEDITATION SESSION"))
                self?.songManager.updateToPickingViewModels()
            case .listening:
                self?.actionOperator.set(mode: .player)
                self?.songManager.updateToListeningViewModels()
            case .finished:
                print("Present Finished")
            }
        }

        songManager.didFinishPlaying = { [weak self] in self?.stateOperator.next() }
    }

}
