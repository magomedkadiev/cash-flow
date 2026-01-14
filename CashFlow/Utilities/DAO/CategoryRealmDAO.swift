import Foundation
import RealmSwift

class CategoryRealmDAO: CategoryDAO {
    
    private var realmManager = RealmManager.shared

    func fetchAllCategories() -> [Category] {
        let realm = try! Realm()
        if let categories = realm.object(ofType: CategoryList.self, forPrimaryKey: 0)?.categories {
            return Array(categories)
        }
        return []
    }

    func createNew(category: CategoryPO, complitionHandler: @escaping () -> Void?) {
        realmManager.write { realm in
            var categoryList = realm.object(ofType: CategoryList.self, forPrimaryKey: 0) ?? realm.create(CategoryList.self, value: [])
            
            if let exist = categoryList.categories.filter("id = %@", category.parentID).first {
                let category = Category(id: UUID().uuidString, name: category.name, parentID: category.parentID, subCategories: [])
                exist.subCategories.append(category)
            } else {
                let newCategory = Category(id: category.id, name: category.name, parentID: category.parentID, subCategories: [])
                categoryList.categories.append(newCategory)
                realm.add(newCategory)
            }
        } onSuccess: {
            complitionHandler()
        } onFailure: {
            complitionHandler()
        }
    }
    
    func replaceParentCategory(oldID: String, newCategory: CategoryPO, complitionHandler: @escaping () -> Void?) {
        realmManager.write { realm in
            
            if let existing = realm.object(ofType: Category.self, forPrimaryKey: newCategory.id) {
                existing.parentID = newCategory.parentID
                
                if let oldParent = realm.object(ofType: Category.self, forPrimaryKey: oldID),
                   let index = oldParent.subCategories.firstIndex(where: { $0.id == existing.id }) {
                    oldParent.subCategories.remove(at: index)
                }
                
                if let newParent = realm.object(ofType: Category.self, forPrimaryKey: newCategory.parentID) {
                    if !newParent.subCategories.contains(where: { $0.id == existing.id }) {
                        newParent.subCategories.append(existing)
                    }
                }
            }
        } onSuccess: {
            complitionHandler()
        } onFailure: {
            complitionHandler()
        }

    }
    
    func remove(_ category: Category) {
        let realm = try! Realm()
        
        try! realm.write {
            if let categoryList = realm.object(ofType: CategoryList.self, forPrimaryKey: 0) {
                if let category = categoryList.categories.filter("id = %@", category.id).first {
                    for sub in category.subCategories {
                        realm.delete(sub)
                    }
                    realm.delete(category)
                }
            }
        }
    }
    
    func move(from: Int, to: Int) {
        let realm = try! Realm()
        try! realm.write {
            if let categoryList = realm.object(ofType: CategoryList.self, forPrimaryKey: 0) {
                let categories = categoryList.categories
                var destTO = to

                if from < to {
                    destTO = to + 1
                }
                categories.move(fromOffsets: IndexSet(integer: from), toOffset: destTO)
                categoryList.categories = categories
            }
            
        }
    }
    
    func loadCategoryTemplates(_ categories: [Category]) {
        let realm = try! Realm()
        
        try! realm.write {
            let categoryList = realm.create(CategoryList.self, value: [])
            categoryList.categories.append(objectsIn: categories)
        }
    }
}

