import UIKit

class SongViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        addSubviews()
        setupLayout()
        interactiveView.reset()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let interactiveView = SongInteractiveView()
    let separatorView = UIView(frame: .zero)

    func animateAppearance(delay: TimeInterval, animator: Animating = Animator()) {
        guard !didPerformAppearanceAnimation else { return }
        interactiveView.animateAppearance(delay: delay,
                                          completion: { self.didPerformAppearanceAnimation = true })
    }

    var disposable: Disposable?

    override func prepareForReuse() {
        super.prepareForReuse()
        interactiveView.reset()
        disposable?.dispose()
    }

    // MARK: - Privates

    private var didPerformAppearanceAnimation = false

    private func configureSubviews() {
        selectionStyle = .none
        contentView.backgroundColor = interactiveView.unselectedBackgroundColor
        setSelected(false, animated: false)
    }

    private func addSubviews() {
        contentView.addSubview(interactiveView)
        contentView.addSubview(separatorView)
    }

    private func setupLayout() {
        interactiveView.pinTop(to: contentView.topAnchor)
        interactiveView.pinLeading(to: contentView.leadingAnchor)
        interactiveView.pinTrailing(to: contentView.trailingAnchor)
        separatorView.pinLeading(to: interactiveView.songView.checkBoxView.leadingAnchor)
        separatorView.pinTrailing(to: trailingAnchor)
        separatorView.pinHeight(0.5)
        separatorView.pinBottom(to: contentView.bottomAnchor)
    }

}
