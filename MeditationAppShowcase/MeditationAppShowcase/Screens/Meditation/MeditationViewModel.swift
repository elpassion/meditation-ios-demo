protocol MeditationViewModeling: class {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    func viewDidAppear()
    func viewWillDisappear()
    func backAction()
    var closeMeditation: (() -> Void)? { get set }
}

class MeditationViewModel: MeditationViewModeling {

    init(actionOperator: ActionOperating,
         tabBarOperator: TabBarOperating,
         songViewModels: [SongPickerViewModeling]) {
        self.actionOperator = actionOperator
        self.tabBarOperator = tabBarOperator
        self.songViewModels = songViewModels
    }

    // MARK: - MeditationViewModeling

    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)?

    func viewDidAppear() {
        songPickerViewModels?(songViewModels)
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
    private let songViewModels: [SongPickerViewModeling]
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        actionOperator.set(mode: .player)
    }

}
