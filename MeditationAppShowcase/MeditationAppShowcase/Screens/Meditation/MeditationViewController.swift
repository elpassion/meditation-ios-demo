import UIKit

class MeditationViewController: UIViewController, UITableViewDataSource {

    init(viewModel: MeditationViewModeling,
         actionControllerOperator: ActionControllerOperating) {
        self.viewModel = viewModel
        self.actionControllerOperator = actionControllerOperator
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
        configureSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        meditationView.animateAppearance()
        viewModel.viewDidAppear()
        disposable = actionControllerOperator.controller?.actionHandler.addHandler(
            target: self,
            handler: MeditationViewController.handle)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposable?.dispose()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return songPickerViewModels.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SongPickerViewCell.description(),
                                                       for: indexPath) as? SongPickerViewCell else {
                                                        fatalError("Could not dequeue such cell")
        }
        configure(cell: cell, with: songPickerViewModels[indexPath.row])
        return cell
    }

    // MARK: - Privates

    private let viewModel: MeditationViewModeling
    private let actionControllerOperator: ActionControllerOperating
    private var disposable: Disposable?

    private var songPickerViewModels = [SongPickerViewModeling]() {
        didSet {
            meditationView.tableView.reloadData()
        }
    }

    private var meditationView: MeditationView! {
        return view as? MeditationView
    }

    private func configureSubviews() {
        meditationView.tableView.dataSource = self
        meditationView.tableView.allowsMultipleSelection = true
        meditationView.tableView.showsVerticalScrollIndicator = false
        meditationView.tableView.register(SongPickerViewCell.self,
                                          forCellReuseIdentifier: SongPickerViewCell.description())
        meditationView.tableView.separatorStyle = .none
        viewModel.songPickerViewModels = { [weak self] in self?.songPickerViewModels = $0 }
        viewModel.presentPlayMode = { [weak self] in self?.actionControllerOperator.controller?.currentMode = .player
        }
    }

    private func configure(cell: SongPickerViewCell, with viewModel: SongPickerViewModeling) {
        cell.animateAppearance(delay: viewModel.appearanceAnimationDelay)
        cell.titleLabel.text = viewModel.title
        cell.subtitleLabel.text = viewModel.subtitle
        cell.timeLabel.text = viewModel.time
    }

    // MARK: - Handlers

    private func handle(action: ActionViewController.Action) {
        if action == .button {
            actionControllerOperator.controller?.currentMode = .player
        }
    }

}
