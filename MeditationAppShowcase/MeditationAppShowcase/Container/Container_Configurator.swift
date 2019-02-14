protocol AppConfiguratorContaining {
    func appConfigurator() -> ActionControllerConfiguring & ActionControllerOperating
}

extension Container: AppConfiguratorContaining {

    // MARK: - AppConfiguratorContaining

    func appConfigurator() -> ActionControllerConfiguring & ActionControllerOperating {
        return sharedAppConfigurator
    }

    // MARK: - 

    func appViewControllersFactory() -> AppViewControllersFactory {
        return AppViewControllersFactory(home: { [unowned self] in self.homeViewController() },
                                         actionController: { [unowned self] in self.actionViewController() }
        )
    }

}
