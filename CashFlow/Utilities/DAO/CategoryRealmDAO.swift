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
            
            var categoryList = realm.object(ofType: CategoryList.self, forPrimaryKey: 0)
            
            if categoryList == nil {
                categoryList = realm.create(CategoryList.self, value: [])
            }
            
            if let exist = categoryList?.categories.filter("id = %@", category.id).first {
                let category = Category(id: UUID().uuidString, name: category.name, subCategories: [])
                exist.subCategories.append(category)
            } else {
                let newCategory = Category(id: category.id, name: category.name, subCategories: [])
                categoryList?.categories.append(newCategory)
                realm.add(newCategory)
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
        
        /*
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
         */
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
            var categoryList = realm.create(CategoryList.self, value: [])
            categoryList.categories.append(objectsIn: categories)
        }
    }
}

