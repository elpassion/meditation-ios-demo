protocol MeditationViewModeling {
    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)? { get set }
    func viewDidAppear()
}

class MeditationViewModel: MeditationViewModeling {

    // MARK: - MeditationViewModeling

    var songPickerViewModels: (([SongPickerViewModeling]) -> Void)?

    func viewDidAppear() {
        let viewModels = [
            SongPickerViewModel(appearanceAnimationDelay: 0.1),
            SongPickerViewModel(appearanceAnimationDelay: 0.2),
            SongPickerViewModel(appearanceAnimationDelay: 0.3),
            SongPickerViewModel(appearanceAnimationDelay: 0.4),
            SongPickerViewModel(appearanceAnimationDelay: 0.5),
            SongPickerViewModel(appearanceAnimationDelay: 0.6),
            SongPickerViewModel(appearanceAnimationDelay: 0.7),
            SongPickerViewModel(appearanceAnimationDelay: 0.8),
            SongPickerViewModel(appearanceAnimationDelay: 0.9),
            SongPickerViewModel(appearanceAnimationDelay: 1.0)
        ]
        songPickerViewModels?(viewModels)
    }

}
