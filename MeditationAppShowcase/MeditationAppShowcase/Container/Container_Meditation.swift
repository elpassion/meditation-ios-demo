import UIKit

protocol MeditationContaining {
    func meditationViewController() -> UIViewController
}

extension Container: MeditationContaining {

    // MARK: - MeditationContaining

    func meditationViewController() -> UIViewController {
        return MeditationViewController(viewModel: meditationViewModel(),
                                        actionControllerOperator: appConfigurator())
    }

    // MARK: - Privates

    private func meditationViewModel() -> MeditationViewModeling {
        return MeditationViewModel()
    }

}
