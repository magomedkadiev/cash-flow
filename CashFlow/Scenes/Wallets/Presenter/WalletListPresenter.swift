import Foundation

class WalletListPresenter {
    
    weak var view: WalletListInputViewProtocol?
    var interactor: WalletListInteractorInputProtocol
    let router: ApplicationRouter
    
    init(view: WalletListInputViewProtocol, interactor: WalletListInteractorInputProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension WalletListPresenter: WalletListOutputViewProtocol {
    
    func viewDidLoad() {
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        viewObjects.append(WalletListViewObject())
        
        view?.showInfo(viewObjects)
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismissWalletListViewController(viewObject)
    }
}

extension WalletListPresenter: WalletListInteractorOutputProtocol {
    
}

