import Foundation

struct OperationSectionObject {
    let date: Date
    let operations: [OperationViewObject]
}

class OperationsPresenter {
    
    weak var view: OperationsInputViewProtocol?
    var interactor: OperationsInteractorInputProtocol
    let mapper: OperationsPOToOperationViewObjectsMapperProtocol
    let router: ApplicationRouter
    
    init(view: OperationsInputViewProtocol, interactor: OperationsInteractorInputProtocol, mapper: OperationsPOToOperationViewObjectsMapperProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    private func fillViewObjectsToShow(operations: [CashFlowTableViewCellViewObject]? = nil) {
        guard var operations = operations as? [OperationViewObject] else { return }
        var operationSectionObject = [OperationSectionObject]()

        let viewObjectsByDateGrouping = Dictionary(grouping: operations.sorted(by: { ($0.date) > ($1.date) }),
                                  by: { Calendar.current.startOfDay(for: $0.date) })
        
        let sortedKeysByDates = viewObjectsByDateGrouping.keys.sorted(by: >)
        operationSectionObject = sortedKeysByDates.map {
            OperationSectionObject(date: $0, operations: viewObjectsByDateGrouping[$0]!)
        }
        
        view?.showInfo(operationSectionObject)
    }
}

extension OperationsPresenter: OperationsOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
        interactor.fetchAllOperations()
    }
    
    func fetchAllOperations() {
        interactor.fetchAllOperations()
    }
}

extension OperationsPresenter: OperationsInteractorOutputProtocol {
    
    func reloadDataWith(_ operations: [OperationPO]) {
        let mappedOperations = mapper.map(operations)
        fillViewObjectsToShow(operations: mappedOperations)
    }
    
    func eventBeginFerfeshing() {
        router.openOperationCreationScreen()
    }
}
