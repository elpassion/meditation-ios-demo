import UIKit

class HomeViewController: UIViewController {

    init(viewModel: HomeViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    let viewModel: HomeViewModeling

    required init?(coder aDecoder: NSCoder) { return nil }

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    // MARK: - Privates

    private var homeView: HomeView! {
        return view as? HomeView
    }

    private func setupSubviews() {
        viewModel.backgroundRipImage = { [homeView] image in
            homeView?.backgroundRipImageView.image = image
        }
        viewModel.ripImage = { [homeView] image in
            homeView?.ripImageView.image = image
        }
        viewModel.viewDidLoad()
    }

}

