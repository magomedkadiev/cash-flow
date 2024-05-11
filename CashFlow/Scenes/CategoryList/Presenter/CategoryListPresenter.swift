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
        
        view?.showInfo(viewObjects)
    }
    
    private func doesCategoryOpenedFromCreationScene() -> Bool {
        if (router.getChildrenViewController() as? OperationCreationViewController) != nil {
            return true
        }
        return false
    }
}

extension CategoryListPresenter: CategoryListOutputViewProtocol {
    
    func viewDidLoad() {
        fetchAllCategories()
        view?.hideBarButtonItemIfNedeed(doesCategoryOpenedFromCreationScene())
    }
    
    func fetchAllCategories() {
        interactor.fetchAllCategories()
    }
    
    func dismissViewController() {
        router.dismiss()
    }
    
    func addButtonTapped() {
        router.openCategoryCreationScreen(nil)
    }
    
    func openCategoryCreationScreen(with viewObject: CashFlowTableViewCellViewObject) {
        router.openCategoryCreationScreen(viewObject)
    }
    
    func removeItemEvent(_ viewObject: CashFlowTableViewCellViewObject) {
        guard let viewObject = viewObject as? CategoryListViewObject else {
            return
        }
        interactor.removeCategory(viewObject)
    }
    
    func didSelectItemEvent(_ viewObjects: [CategoryListViewObject], indexPath: IndexPath) {

        if doesCategoryOpenedFromCreationScene() {
            let viewObject: CategoryListViewObject!
            if indexPath.row == 0 {
                viewObject = viewObjects[indexPath.section]
            } else {
                viewObject = viewObjects[indexPath.section].subCategories[indexPath.row - 1]
            }
            view?.didSelectHandler(viewObject)
            dismissViewController()
        } else {
            var viewObject: CategoryListViewObject!
            if indexPath.row == 0 {
                viewObject = viewObjects[indexPath.section]
                let subCat = viewObjects[indexPath.section]
                viewObject.subCategories = [subCat]
            } else {
                viewObject = viewObjects[indexPath.section]
                let subCat = viewObject.subCategories[indexPath.row - 1]
                viewObject.subCategories = [subCat]
            }
            openCategoryCreationScreen(with: viewObject)
        }
    }
    
    func reorderCategoriesButtonTapped() {
        router.openCategoryParentList()
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
    func reloadDataWith(_ plainObjects: [CategoryPO]) {
        let mappedViewObject = mapper.map(plainObjects)
        fillViewObjectsToShow(mappedViewObject)
    }
}
