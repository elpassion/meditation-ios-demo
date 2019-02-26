import UIKit

protocol MeditationContaining {
    func meditationViewController(viewModel: MeditationViewModeling) -> UIViewController
}

extension Container: MeditationContaining {

    // MARK: - MeditationContaining

    func meditationViewController(viewModel: MeditationViewModeling) -> UIViewController {
        return MeditationViewController(viewModel: viewModel,
                                        actionViewControllerOperator: appConfigurator())
    }

    func meditationViewModel() -> MeditationViewModeling {
        return MeditationViewModel(viewModels: MeditationViewModel.preparedViewModels(),
                                   actionOperator: sharedActionViewModel,
                                   tabBarOperator: tabBarViewModel(),
                                   musicPlayer: MusicPlayer(),
                                   screenStateOperator: MeditationScreenStateOperator())
    }

}
