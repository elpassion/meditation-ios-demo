import UIKit

class HomeViewController: UIViewController {

    init(viewModel: HomeViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    let viewModel: HomeViewModeling

    required init?(coder aDecoder: NSCoder) { return nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    // MARK: - Privates

}

