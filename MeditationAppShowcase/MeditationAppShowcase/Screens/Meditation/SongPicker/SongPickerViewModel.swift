import Foundation

protocol SongPickerViewModeling {
    var AppearanceAnimationDelay: TimeInterval { get }
}

struct SongPickerViewModel: SongPickerViewModeling {

    // MARK: - SongPickerViewModeling

    let AppearanceAnimationDelay: TimeInterval

}
