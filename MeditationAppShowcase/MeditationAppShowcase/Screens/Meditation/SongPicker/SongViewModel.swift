import Foundation

protocol SongViewModeling: class {
    var appearanceAnimationDelay: TimeInterval { get }
    var title: String { get }
    var subtitle: String { get }
    var time: String { get }
    var songMode: SongMode { get set }
    var songModeHandler: SongModeHandling { get }
}

class SongViewModel: SongViewModeling {

    init(appearanceAnimationDelay: TimeInterval, title: String, subtitle: String, time: String) {
        self.appearanceAnimationDelay = appearanceAnimationDelay
        self.title = title
        self.subtitle = subtitle
        self.time = time
    }

    // MARK: - SongViewModeling

    let appearanceAnimationDelay: TimeInterval
    var title: String
    var subtitle: String
    var time: String

    var songMode: SongMode = .picking(.unselected) {
        didSet {
            guard oldValue != songMode else { return }
            emitter.emit(songMode)
        }
    }

    var songModeHandler: SongModeHandling {
        return emitter
    }

    // MARK: - Privates

    private let emitter = SongModeEmitter()

}
