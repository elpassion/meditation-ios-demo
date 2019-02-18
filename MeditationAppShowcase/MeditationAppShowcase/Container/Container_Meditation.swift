import UIKit

protocol MeditationContaining {
    func meditationViewController() -> UIViewController
}

extension Container: MeditationContaining {

    // MARK: - MeditationContaining

    func meditationViewController() -> UIViewController {
        return MeditationViewController(viewModel: meditationViewModel())
    }

    // MARK: - Privates

    private func meditationViewModel() -> MeditationViewModeling {
        return MeditationViewModel(actionOperator: sharedActionViewModel)
    }

}
