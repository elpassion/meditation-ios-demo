import UIKit

class MeditationView: GradientView {

    init() {
        super.init(style: GradientStyle(colors: [GradientColor(location: 0.0, color: UIColor(rgb: 0xFBFCFC)),
                                                 GradientColor(location: 1.0, color: UIColor(rgb: 0xF3F5F6))],
                                        direction: .vertical))
        addSubviews()
        setupLayout()
        prepareAnimations()
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let navigationView = NavigationView()
    let tableView = SubviewFactory.tableView()

    // MARK: - Privates

    private let navigationBarHeight: CGFloat = 56
    private let tabBarHeight: CGFloat = 54
    private let bottomGradientHeight: CGFloat = 130
    private let bottomGradientView = SubviewFactory.bottomGradientView()

    private func addSubviews() {
        addSubview(navigationView)
        addSubview(tableView)
        addSubview(bottomGradientView)
    }

    private func setupLayout() {
        navigationView.pinTop(to: safeAreaLayoutGuide.topAnchor)
        navigationView.pinLeading(to: leadingAnchor)
        navigationView.pinTrailing(to: trailingAnchor)
        navigationView.pinHeight(navigationBarHeight)
        tableView.pinTop(to: navigationView.bottomAnchor, offset: 16)
        tableView.pinLeading(to: leadingAnchor, offset: 16)
        tableView.pinTrailing(to: trailingAnchor)
        tableView.pinBottom(to: bottomAnchor)
        bottomGradientView.pinLeading(to: leadingAnchor)
        bottomGradientView.pinTrailing(to: trailingAnchor)
        bottomGradientView.pinHeight(bottomGradientHeight)
        bottomGradientView.pinBottom(to: bottomAnchor, offset: 10)
    }

    private func prepareAnimations() {
        navigationView.transform = CGAffineTransform(translationX: 0, y: -navigationBarHeight)
        tableView.transform = CGAffineTransform(translationX: 0, y: 50)
        tableView.alpha = 0
    }

    private func configureSubviews() {
        backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(top: 0,
                                              left: 0,
                                              bottom: bottomGradientHeight - 27,
                                              right: 0)
    }

}

private extension MeditationView {

    struct SubviewFactory {

        static func tableView() -> UITableView {
            let tableView = UITableView(frame: .zero)
            tableView.backgroundColor = UIColor(rgb: 0xF9FAFB)
            return tableView
        }

        static func bottomGradientView() -> GradientView {
            let gradientStyle = GradientStyle(colors: [GradientColor(location: 0.0,
                                                                     color: UIColor(white: 1,
                                                                                    alpha: 0)),
                                                       GradientColor(location: 0.2,
                                                                     color: .white),
                                                       GradientColor(location: 1.0,
                                                                     color: UIColor(rgb: 0xF3F5F6))],
                                      direction: .vertical)
            let gradientView = GradientView(style: gradientStyle)
            return gradientView
        }

    }

}
