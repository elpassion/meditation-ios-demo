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
        animateBackground()
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

    private func animateBackground() {
        let initialRotation = CGFloat.pi * 0.015
        homeView.backgroundRipImageView.transform = CGAffineTransform(rotationAngle: -initialRotation)
        UIView.animateKeyframes(withDuration: 4.0,
                                delay: 0.0,
                                options: [.repeat, .autoreverse, .beginFromCurrentState, .calculationModeDiscrete],
                                animations: { self.homeView.backgroundRipImageView.transform = CGAffineTransform(rotationAngle: 2 * initialRotation) },
                                completion: nil)
    }

}

