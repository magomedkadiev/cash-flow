import Foundation

class CategoryListPresenter {
    
    weak var view: CategoryListInputViewProtocol?
    var interactor: CategoryListinteractorInputProtocol
    let router: ApplicationRouter
    var mapper: CategoryPOToCategoryViewObjectMapperProtocol
    
    init(view: CategoryListInputViewProtocol, interactor: CategoryListinteractorInputProtocol, router: ApplicationRouter, mapper: CategoryPOToCategoryViewObjectMapperProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.mapper = mapper
    }
    
    private func fillViewObjectsToShow(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        guard var viewObjects = viewObjects as? [CategoryListViewObject] else {
            return
        }
        
        let objectsByParentID = Dictionary(grouping: viewObjects, by: \.parentID)
        for i in 0..<viewObjects.count {
            viewObjects[i].subCategories = objectsByParentID[viewObjects[i].id] ?? []
        }

        let filteredViewObjects = viewObjects.filter { $0.parentID.isEmpty }
        view?.showInfo(filteredViewObjects)
    }
}

extension CategoryListPresenter: CategoryListOutputViewProtocol {
    
    func viewDidLoad() {
        fetchAllCategories()        
    }
    
    func fetchAllCategories() {
        interactor.fetchAllCategories()
    }
    
    func dismissViewController() {
        router.dismiss()
    }
    
    func isReadyForEditing() -> Bool {
        if (router.getChildrenViewController() as? OperationCreationViewController) != nil {
            return false
        }
        return true
    }
    
    func addButtonTapped() {
        router.openCategoryCreationScreen(nil)
    }
    
    func openCategoryCreationScreen(with viewObject: CashFlowTableViewCellViewObject) {
        router.openCategoryCreationScreen(viewObject)
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
    func reloadDataWith(_ plainObjects: [CategoryPO]) {
        let mappedViewObject = mapper.map(plainObjects)
        fillViewObjectsToShow(mappedViewObject)
    }
}
