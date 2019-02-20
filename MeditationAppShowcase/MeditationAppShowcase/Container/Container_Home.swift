import UIKit

protocol HomeContaining {
    func homeViewController() -> UIViewController
}

extension Container: HomeContaining {

    // MARK: - HomeContaining

    func homeViewController() -> UIViewController {
        return HomeViewController(viewModel: homeViewModel(),
                                  notificationHandler: NotificationCenter.default,
                                  presenter: ViewControllerPresenter(),
                                  meditationViewControllerFactory: { [unowned self] viewModel in
                                        self.meditationViewController(viewModel: viewModel)
                                  },
                                  actionViewControllerOperator: appConfigurator(),
                                  animator: Animator()
        )
    }

    private func homeViewModel() -> HomeViewModeling {
        return HomeViewModel(actionOperator: sharedActionViewModel,
                             tabBarOperator: tabBarViewModel(),
                             meditationViewModelFactory: { [unowned self] in
                                self.meditationViewModel()
                             }
        )
    }

}
