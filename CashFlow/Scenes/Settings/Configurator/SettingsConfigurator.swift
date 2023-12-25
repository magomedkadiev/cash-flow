import Foundation

class SettingsConfigurator {
    
    func configure(_ viewController: SettingsViewController) {
        let interactor = SettingsInteractor()
        let router: ApplicationRouter = Router()
        let presenter = SettingsPresenter(view: viewController, interactor: interactor, router: router)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
