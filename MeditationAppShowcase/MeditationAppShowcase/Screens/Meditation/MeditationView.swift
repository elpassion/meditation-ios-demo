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

    func animateAppearance() {
        UIView.animate(withDuration: 0.2,
                       delay: 0.05,
                       options: .curveEaseOut,
                       animations: {
                        self.navigationView.transform = .identity
                        self.tabBarView.transform = .identity
        },
                       completion: nil)
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: .curveEaseInOut,
                       animations: {
                            self.tableView.transform = .identity
                            self.tableView.alpha = 1
                       },
                       completion: nil)
    }

    // MARK: - Privates

    private let navigationBarHeight: CGFloat = 56
    private let tabBarHeight: CGFloat = 54

    private func addSubviews() {
        addSubview(navigationView)
        addSubview(tableView)
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
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.backgroundColor = .lightGray
            return tableView
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
