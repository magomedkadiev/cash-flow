import Foundation

class CategoryParentListPresenter {
    
    weak var view: CategoryParentListInputViewProtocol?
    var interactor: CategoryParentListInteractorInputProtocol?
    var mapper: CategoryToCategoryParentViewObjectMapperProtocol
    
    init(view: CategoryParentListInputViewProtocol, mapper: CategoryToCategoryParentViewObjectMapperProtocol) {
        self.view = view
        self.mapper = mapper
    }
}

extension CategoryParentListPresenter: CategoryParentListOutputViewProtocol {
    
    func viewDidLoad() {
        interactor?.fetchAllCategories()
    }
}

extension CategoryParentListPresenter: CategoryParentListInteractorOutputProtocol {
    
    func reloadDataWith(_ plainObjects: [CategoryPO]) {
        let mappedViewObjects = mapper.map(plainObjects)
        view?.showInfo(mappedViewObjects)
    }
    
    func moveRow(from: Int, to: Int) {
        interactor?.moveRow(from, to)
    }
}
