import Foundation
import RealmSwift

class CategoryRealmDAO: CategoryDAO {
    
    private var realmManager = RealmManager.shared

    func fetchAllCategories() -> [Category] {
        let realm = try! Realm()
        let results = Array(realm.objects(Category.self))
        return results
    }
    
    func createNew(category: CategoryPO, complitionHandler: @escaping () -> Void?) {
        realmManager.write { realm in
            let storedProreties = Category(id: category.id, name: category.name, parentID: category.parentID)
            realm.add(storedProreties, update: .modified)
        } onSuccess: {
            complitionHandler()
        } onFailure: {
            complitionHandler()
        }
    }
}
