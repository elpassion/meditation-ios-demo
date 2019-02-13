import Foundation

protocol SongPickerViewModeling {
    var appearanceAnimationDelay: TimeInterval { get }
}

struct SongPickerViewModel: SongPickerViewModeling {

    // MARK: - SongPickerViewModeling

    let appearanceAnimationDelay: TimeInterval

}
