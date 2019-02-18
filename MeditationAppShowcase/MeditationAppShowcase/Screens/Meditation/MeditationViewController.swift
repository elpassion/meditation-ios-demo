import UIKit

class MeditationViewController: UIViewController, UITableViewDataSource {

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
        configureSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        meditationView.animateAppearance()
        viewModel.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
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
    }

    private func configure(cell: SongPickerViewCell, with viewModel: SongPickerViewModeling) {
        cell.animateAppearance(delay: viewModel.appearanceAnimationDelay)
        cell.interactiveView.songView.titleLabel.text = viewModel.title
        cell.interactiveView.songView.subtitleLabel.text = viewModel.subtitle
        cell.interactiveView.songView.timeLabel.text = viewModel.time
    }

}
