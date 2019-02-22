protocol MeditationViewModeling: class {
    var latestSongViewModels: (([SongViewModeling]) -> Void)? { get set }
    func viewDidAppear()
    func viewWillDisappear()
    func backAction()
    var closeMeditation: (() -> Void)? { get set }
}

class MeditationViewModel: MeditationViewModeling {

    init(actionOperator: ActionOperating,
         tabBarOperator: TabBarOperating,
         songViewModels: [SongViewModeling]) {
        self.actionOperator = actionOperator
        self.tabBarOperator = tabBarOperator
        self.songViewModels = songViewModels
    }

    // MARK: - MeditationViewModeling

    var latestSongViewModels: (([SongViewModeling]) -> Void)?

    func viewDidAppear() {
        latestSongViewModels?(songViewModels)
        disposable = actionOperator.actionHandler.addHandler(
            target: self,
            handler: MeditationViewModel.handleAction)
        tabBarOperator.isBarVisible = true
    }

    func viewWillDisappear() {
        disposable?.dispose()
    }

    func backAction() {
        closeMeditation?()
    }

    // MARK: - MeditationViewOperating

    var closeMeditation: (() -> Void)?

    // MARK: - Privates

    private let actionOperator: ActionOperating
    private let tabBarOperator: TabBarOperating
    private let songViewModels: [SongViewModeling]
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        actionOperator.set(mode: .player)
    }

}
