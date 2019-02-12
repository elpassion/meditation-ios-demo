protocol CommonsContainer {
    func actionButton() -> ActionButton
    func actionButtonConfigurator() -> ActionButtonConfiguring & ActionButtonOperating
}

extension Container: CommonsContainer {

    // MARK: - CommonsContainer

    func actionButton() -> ActionButton {
        return ActionButton()
    }

    func actionButtonConfigurator() -> ActionButtonConfiguring & ActionButtonOperating {
        return sharedActionButtonConfigurator
    }

}
