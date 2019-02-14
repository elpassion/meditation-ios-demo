protocol MeditationViewModeling: class {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    var presentPlayMode: (() -> Void)? { get set }
    func viewDidAppear()
    func actionButtonTap()
}

class MeditationViewModel: MeditationViewModeling {

    // MARK: - MeditationViewModeling

    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)?

    var presentPlayMode: (() -> Void)?

    func viewDidAppear() {
        songPickerViewModels?(preparedViewModels)
    }

    func actionButtonTap() {
        presentPlayMode?()
    }

}
