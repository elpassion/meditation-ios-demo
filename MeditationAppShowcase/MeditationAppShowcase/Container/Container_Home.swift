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
                                  meditationViewControllerFactory: { [unowned self] in
                                        self.meditationViewController()
                                  },
                                  actionViewControllerOperator: appConfigurator(),
                                  animator: Animator()
        )
    }

    // MARK: - Privates

    private func homeViewModel() -> HomeViewModeling {
        return HomeViewModel(actionOperator: sharedActionViewModel)
    }

}
