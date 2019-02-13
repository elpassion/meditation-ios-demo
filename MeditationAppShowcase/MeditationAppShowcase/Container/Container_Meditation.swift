import UIKit

protocol MeditationContainer {
    func meditationViewController() -> UIViewController
}

extension Container: MeditationContainer {

    // MARK: - MeditationContainer

    func meditationViewController() -> UIViewController {
        return MeditationViewController(viewModel: meditationViewModel())
    }

    func meditationViewModel() -> MeditationViewModeling {
        return MeditationViewModel()
    }

}
