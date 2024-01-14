import Foundation
import RealmSwift

class CategoryRealmDAO: CategoryDAO {
    
    private var realmManager = RealmManager.shared

    func fetchAllCategories() -> [Category] {
        let realm = try! Realm()
        let results = Array(realm.objects(Category.self))
        return results
    }
    
    func fetchAllParentCategories() -> [Category] {
        let realm = try! Realm()
        let results = Array(realm.objects(Category.self)).filter { $0.parentID.isEmpty }
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
    
    func remove(_ category: Category) {
        let realm = try! Realm()
        try! realm.write {
            let categories = realm.objects(Category.self)
            let categoryToRemove = categories.filter("id = %@", category.id)
            
            realm.delete(categoryToRemove)
            let parentCategoryToRemove = realm.objects(Category.self).filter("parentID = %@", category.parentID)

            if parentCategoryToRemove.isEmpty {
                let parentCategoryToRemove2 = realm.objects(Category.self).filter("id = %@", category.parentID)

                realm.delete(parentCategoryToRemove2)
            }
        }
    }
}
