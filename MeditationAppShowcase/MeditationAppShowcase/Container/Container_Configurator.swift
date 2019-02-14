protocol AppConfiguratorContaining {
    func appConfigurator() -> AppConfiguring & ActionControllerOperating
}

extension Container: AppConfiguratorContaining {

    // MARK: - AppConfiguratorContaining

    func appConfigurator() -> AppConfiguring & ActionControllerOperating {
        return sharedAppConfigurator
    }

    // MARK: - 

    func appViewControllersFactory() -> AppViewControllersFactory {
        return AppViewControllersFactory(home: { [unowned self] in self.homeViewController() },
                                         actionController: { [unowned self] in self.actionViewController() }
        )
    }

}
