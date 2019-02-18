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

    let navigationView = SubviewFactory.navigationView()
    let tableView = SubviewFactory.tableView()
    let tabBarView = SubviewFactory.tabBarView()

    // MARK: - Privates

    private let navigationBarHeight: CGFloat = 56
    private let tabBarHeight: CGFloat = 54
    private let bottomGradientHeight: CGFloat = 130
    private let bottomGradientView = SubviewFactory.bottomGradientView()

    private func addSubviews() {
        addSubview(navigationView)
        addSubview(tableView)
        addSubview(bottomGradientView)
        addSubview(tabBarView)
    }

    private func setupLayout() {
        let offset: CGFloat = 16
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: navigationBarHeight),
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            tableView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor),
            bottomGradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomGradientView.heightAnchor.constraint(equalToConstant: bottomGradientHeight),
            bottomGradientView.bottomAnchor.constraint(equalTo: tabBarView.centerYAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func prepareAnimations() {
        navigationView.transform = CGAffineTransform(translationX: 0, y: -navigationBarHeight)
        tableView.transform = CGAffineTransform(translationX: 0, y: 50)
        tableView.alpha = 0
        tabBarView.transform = CGAffineTransform(translationX: 0, y: tabBarHeight)
    }

    private func configureSubviews() {
        backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(top: 0,
                                              left: 0,
                                              bottom: bottomGradientHeight - tabBarHeight / 2,
                                              right: 0)
        let shadow = SketchShadow(color: .gray, x: 0, y: 2, blur: 4, spread: 0)
        tabBarView.layer.apply(shadow)
    }

}

private extension MeditationView {

    struct SubviewFactory {

        static func navigationView() -> NavigationView {
            let view = NavigationView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func tableView() -> UITableView {
            let tableView = UITableView(frame: .zero)
            tableView.backgroundColor = UIColor(rgb: 0xF9FAFB)
            tableView.translatesAutoresizingMaskIntoConstraints = false
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
            gradientView.translatesAutoresizingMaskIntoConstraints = false
            return gradientView
        }

        static func tabBarView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "tabBar")
            imageView.contentMode = .center
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

    }

}
