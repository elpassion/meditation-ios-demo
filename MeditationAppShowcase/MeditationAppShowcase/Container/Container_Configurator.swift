protocol AppConfiguratorContaining {
    func appConfigurator() -> ActionControllerConfiguring & ActionControllerOperating
}

extension Container:  AppConfiguratorContaining {

    func appConfigurator() -> ActionControllerConfiguring & ActionControllerOperating {
        return sharedAppConfigurator
    }

}
