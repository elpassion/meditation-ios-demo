protocol MeditationViewModeling: class {
    var navigationTitle: ((String) -> Void)? { get set }
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
         screenStateOperator: MeditationScreenStateOperating) {
        self.actionOperator = actionOperator
        self.tabBarOperator = tabBarOperator
        self.songManager = songManager
        self.screenStateOperator = screenStateOperator
        configure()
    }

    // MARK: - MeditationViewModeling

    var navigationTitle: ((String) -> Void)?

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
        screenStateOperator.repeatCurrentState()
    }

    func viewWillDisappear() {
        disposable?.dispose()
    }

    func backAction() {
        screenStateOperator.previous()
    }

    // MARK: - MeditationViewOperating

    var closeMeditation: (() -> Void)?

    // MARK: - Privates

    private let actionOperator: ActionOperating
    private let tabBarOperator: TabBarOperating
    private let songManager: SongManaging
    private let screenStateOperator: MeditationScreenStateOperating
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        switch action {
        case .button:
            screenStateOperator.next()
        case .rewind:
            songManager.playPrevious()
        case .play: ()
        case .forward:
            songManager.playNext()
        }
    }

    private func configure() {
        screenStateOperator.stateUpdated = { [weak self] state in
            switch state {
            case .dismiss:
                self?.closeMeditation?()
            case .picking:
                self?.actionOperator.set(mode: .singleButton(title: "START MEDITATION SESSION"))
                self?.songManager.updateToPickingViewModels()
                self?.navigationTitle?("Pick meditation song")
            case .listening:
                self?.actionOperator.set(mode: .player)
                self?.songManager.updateToListeningViewModels()
                self?.navigationTitle?("Player")
            case .finished:
                self?.closeMeditation?()
            }
        }

        songManager.didFinishPlaying = { [weak self] in self?.screenStateOperator.next() }
    }

}
