import Foundation

protocol SongPickerViewModeling: class {
    var appearanceAnimationDelay: TimeInterval { get }
    var title: String { get }
    var subtitle: String { get }
    var time: String { get }
}

class SongPickerViewModel: SongPickerViewModeling {

    init(appearanceAnimationDelay: TimeInterval, title: String, subtitle: String, time: String) {
        self.appearanceAnimationDelay = appearanceAnimationDelay
        self.title = title
        self.subtitle = subtitle
        self.time = time
    }

    // MARK: - SongPickerViewModeling

    let appearanceAnimationDelay: TimeInterval
    var title: String
    var subtitle: String
    var time: String

}
