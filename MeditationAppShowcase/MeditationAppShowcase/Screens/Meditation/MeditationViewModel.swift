protocol MeditationViewModeling: class {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    func viewDidAppear()
    func viewWillDisappear()
    func backAction()
    var closeMeditation: (() -> Void)? { get set }
}

class MeditationViewModel: MeditationViewModeling {

    init(actionOperator: ActionOperating) {
        self.actionOperator = actionOperator
    }

    // MARK: - MeditationViewModeling

    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)?

    func viewDidAppear() {
        songPickerViewModels?(preparedViewModels)
        disposable = actionOperator.actionHandler.addHandler(
            target: self,
            handler: MeditationViewModel.handleAction)
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
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        actionOperator.set(mode: .player)
    }

}
