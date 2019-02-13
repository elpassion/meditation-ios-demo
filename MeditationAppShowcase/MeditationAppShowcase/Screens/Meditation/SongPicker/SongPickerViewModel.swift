import Foundation

protocol SongPickerViewModeling {
    var appearanceAnimationDelay: TimeInterval { get }
    var title: String { get }
    var subtitle: String { get }
    var time: String { get }
}

struct SongPickerViewModel: SongPickerViewModeling {

    // MARK: - SongPickerViewModeling

    let appearanceAnimationDelay: TimeInterval
    var title: String
    var subtitle: String
    var time: String

}
