import UIKit

class MeditationViewController: UIViewController {

    init(viewModel: MeditationViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func loadView() {
        view = MeditationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        meditationView.animateAppearance()
    }

    // MARK: - Privates

    private let viewModel: MeditationViewModeling

    private var meditationView: MeditationView! {
        return view as? MeditationView
    }

}
