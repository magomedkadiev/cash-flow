import Foundation

class WalletListConfigurator {
        
    func configure(with viewController: WalletListViewController) {
        let interactor = WalletListInteractor()
        let router: ApplicationRouter = Router()
        let presenter = WalletListPresenter(view: viewController, interactor: interactor, router: router)
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
