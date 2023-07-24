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
        
        let cashWalletViewObject = OperationCreationWalletCategoryViewObject(name: "Наличка")
        let cashWalletViewObject1 = OperationCreationWalletCategoryViewObject(name: "Сбер")
        let cashWalletViewObject2 = OperationCreationWalletCategoryViewObject(name: "Тинькоф")
        let cashWalletViewObject3 = OperationCreationWalletCategoryViewObject(name: "Резерв")

        viewObjects.append(cashWalletViewObject)
        viewObjects.append(cashWalletViewObject1)
        viewObjects.append(cashWalletViewObject2)
        viewObjects.append(cashWalletViewObject3)

        view?.showInfo(viewObjects)
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismissWalletListViewController(viewObject)
    }
}

extension WalletListPresenter: WalletListInteractorOutputProtocol {
    
}

