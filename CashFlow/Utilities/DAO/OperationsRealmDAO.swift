import Foundation
import RealmSwift

class OperationsRealmDAO: OperationsDAO {
    
    private var realmManager = RealmManager.shared
    
    func createNew(_ expense: ExpensePO, complitionHandler: @escaping () -> Void?) {
        realmManager.write { realm in
            let storedProreties = Expense(id: expense.id, name: expense.name, totalValue: expense.totalValue)
            realm.add(storedProreties)
        } onSuccess: {
            complitionHandler()
        } onFailure: {
            complitionHandler()
        }
    }
    
    func creationOperation(_ operation: OperationPO, complitionHandler: @escaping () -> Void?) {
        realmManager.write { realm in
            let operationCategory = self.getCategoryForOperation(operation)
            
            let storedProreties = Operation(id: operation.id,
                                            type: operation.type,
                                            category: operationCategory,
                                            totalAmount: operation.sum,
                                            date: operation.date,
                                            comment: operation.comment)
            realm.add(storedProreties, update: .modified)
        } onSuccess: {
            complitionHandler()
        } onFailure: {
            complitionHandler()
        }
    }
    
    func fetchAllOperations() -> [Operation] {
        let realm = try! Realm()
        let results = Array(realm.objects(Operation.self))
        return results
    }
    
    func fetchAllExpenses() -> [Expense] {
        let realm = try! Realm()
        let results = Array(realm.objects(Expense.self))
        return results
    }
    
    private func getCategoryForOperation(_ operation: OperationPO) -> Category? {
        let realm = try! Realm()
        let categories = realm.objects(Category.self)
        return categories.filter("id = %@", operation.category.id).first
    }
}
