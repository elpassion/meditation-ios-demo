protocol AppConfiguratorContaining {
    func appConfigurator()
        -> AppConfiguring & ActionViewControllerOperating
}

extension Container: AppConfiguratorContaining {

    // MARK: - AppConfiguratorContaining

    func appConfigurator()
        -> AppConfiguring & ActionViewControllerOperating {
        return sharedAppConfigurator
    }

    // MARK: - 

    func appViewControllersFactory() -> AppViewControllersFactory {
        return AppViewControllersFactory(home: { [unowned self] in self.homeViewController() },
                                         action: { [unowned self] in self.actionViewController() }
        )
    }

}
