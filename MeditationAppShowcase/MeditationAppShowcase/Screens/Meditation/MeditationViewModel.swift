protocol MeditationViewModeling: class {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    func viewDidAppear()
}

class MeditationViewModel: MeditationViewModeling {

    // MARK: - MeditationViewModeling

    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)?

    func viewDidAppear() {
        songPickerViewModels?(preparedViewModels)
    }

    // MARK: - Privates

}
