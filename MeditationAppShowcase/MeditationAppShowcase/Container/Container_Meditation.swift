import UIKit

protocol MeditationContaining {
    func meditationViewController(viewModel: MeditationViewModeling) -> UIViewController
}

extension Container: MeditationContaining {

    // MARK: - MeditationContaining

    func meditationViewController(viewModel: MeditationViewModeling) -> UIViewController {
        return MeditationViewController(viewModel: viewModel)
    }

    func meditationViewModel() -> MeditationViewModeling {
        return MeditationViewModel(actionOperator: sharedActionViewModel,
                                   tabBarOperator: tabBarViewModel(),
                                   songManager: songManager(),
                                   screenStateOperator: MeditationScreenStateOperator())
    }

    func songManager() -> SongManaging {
        return SongManager(viewModels: MeditationViewModel.preparedViewModels(),
                           songModeOperator: SongModeOperator())
    }

}
