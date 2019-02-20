protocol TabBarViewModeling: class {
    var isBarVisibleUpdated: ((Bool) -> Void)? { get set }
}

protocol TabBarOperating: class {
    var isBarVisible: Bool { get set }
}

class TabBarViewModel: TabBarViewModeling, TabBarOperating {

    // MARK: - TabBarViewModeling

    var isBarVisibleUpdated: ((Bool) -> Void)?

    // MARK: - TabBarOperating

    var isBarVisible = true {
        didSet {
            isBarVisibleUpdated?(isBarVisible)
        }
    }

}
