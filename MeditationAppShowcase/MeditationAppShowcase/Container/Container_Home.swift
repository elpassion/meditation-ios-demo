import UIKit

protocol HomeContainer {
    func homeViewController() -> UIViewController
}

extension Container: HomeContainer {

    func homeViewController() -> UIViewController {
        return HomeViewController(viewModel: homeViewModel(),
                                  notificationHandler: NotificationCenter.default,
                                  presenter: ViewControllerPresenter(),
                                  meditationViewControllerFactory: { [unowned self] in self.meditationViewController() },
                                  actionButtonOperator: actionButtonConfigurator()
        )
    }

    // MARK: - Privates

    private func homeViewModel() -> HomeViewModeling {
        return HomeViewModel()
    }

}
