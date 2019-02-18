protocol MeditationViewModeling: class {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    func viewDidAppear()
    func viewWillDisappear()
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

    // MARK: - Privates

    private let actionOperator: ActionOperating
    private var disposable: Disposable?

    private func handleAction(action: ActionViewController.Action) {
        actionOperator.set(mode: .player)
    }

}
