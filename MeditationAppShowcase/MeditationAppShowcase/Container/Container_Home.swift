import UIKit

protocol HomeContainer {
    func homeViewController() -> UIViewController
}

extension Container: HomeContainer {

    func homeViewController() -> UIViewController {
        return HomeViewController(viewModel: homeViewModel())
    }

    // MARK: - Privates

    private func homeViewModel() -> HomeViewModeling {
        return HomeViewModel()
    }

}
