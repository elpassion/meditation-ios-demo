import UIKit

class MeditationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        meditationView.prepareAnimations()
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
        return songViewModels.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SongViewCell.description(),
                                                       for: indexPath) as? SongViewCell else {
                                                        fatalError("Could not dequeue such cell")
        }
        configure(cell: cell, with: songViewModels[indexPath.row])
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(isSelected: true, index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.didSelect(isSelected: false, index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SongViewCell.height(for: songViewModels[indexPath.row].songMode)
    }

    // MARK: - Privates

    private let viewModel: MeditationViewModeling

    private var songViewModels = [SongViewModeling]() {
        didSet {
            meditationView.tableView.reloadData()
        }
    }

    private var meditationView: MeditationView! {
        return view as? MeditationView
    }

    private func configureSubviews() {
        meditationView.tableView.dataSource = self
        meditationView.tableView.delegate = self
        meditationView.tableView.allowsMultipleSelection = true
        meditationView.tableView.showsVerticalScrollIndicator = false
        meditationView.tableView.register(SongViewCell.self,
                                          forCellReuseIdentifier: SongViewCell.description())
        meditationView.tableView.separatorStyle = .none
        meditationView.navigationView.arrowButton.addTarget(self,
                                                            action: #selector(backAction),
                                                            for: .touchUpInside)
        viewModel.navigationTitle = { [weak self] in
            self?.meditationView.navigationView.titleLabel.text = $0
        }
        viewModel.latestSongViewModels = { [weak self] in self?.songViewModels = $0 }
        viewModel.beginHeightUpdate = { [meditationView] in meditationView?.tableView.beginUpdates() }
        viewModel.endHeightUpdate = { [meditationView] in meditationView?.tableView.endUpdates() }
    }

    private func configure(cell: SongViewCell, with viewModel: SongViewModeling) {
        cell.animateAppearance(delay: viewModel.appearanceAnimationDelay)
        cell.interactiveView.songView.titleLabel.text = viewModel.title
        cell.interactiveView.songView.subtitleLabel.text = viewModel.subtitle
        cell.interactiveView.songView.timeLabel.text = viewModel.time
        cell.update(mode: viewModel.songMode, animated: false)
        cell.disposable = viewModel.songModeHandler.addHandler(target: cell,
                                                               handler: SongViewCell.update)
    }

    // MARK: - Handlers

    @objc private func backAction() {
        viewModel.backAction()
    }

}
