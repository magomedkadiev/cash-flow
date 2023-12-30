import Foundation

class CategoryPOToCategoryViewObjectMapper: CategoryPOToCategoryViewObjectMapperProtocol {
    
    func map(_ operationsPO: [CategoryPO]) -> [CategoryListViewObject] {
        var viewObjects = [CategoryListViewObject]()
        for operationPO in operationsPO {
            let viewObject = CategoryListViewObject(name: operationPO.name, parentID: operationPO.parentID, id: operationPO.id)
            viewObjects.append(viewObject)
        }
        return viewObjects
    }
}

protocol CategoryPOToCategoryViewObjectMapperProtocol {
    func map(_ operationsPO: [CategoryPO]) -> [CategoryListViewObject]
}

/*
 
//        let elementsByParentID = Dictionary(grouping: viewObjects, by: \.parentID)
//
//        for i in 0..<viewObjects.count {
//            viewObjects[i].subCategories = elementsByParentID[viewObjects[i].parentID] ?? []
//        }
//
//
//        for viewObject in viewObjects {
//            viewObject.subCategories = elementsByParentID[viewObject.parentID] ?? []
//        }
 
//        viewObjects.forEach { dump($0) }
 */



/*
 class CategoryPOToCategoryViewObjectMapper: CategoryPOToCategoryViewObjectMapperProtocol {
     
     func map(_ operationsPO: [CategoryPO]) -> [CategoryListViewObject] {
         var viewObjects = [CategoryListViewObject]()
         var subViewOBject = [CategoryListViewObject]()
         
         for operationPO in operationsPO {
             for subCategory in operationPO.subCategories {
                 let subViewObject = CategoryListViewObject(name: subCategory.name, parentID: subCategory.parentID)
                 subViewOBject.append(subViewObject)
             }
             
             
             let viewObject = CategoryListViewObject(name: operationPO.name, subCategories: subViewOBject, parentID: operationPO.parentID)
             viewObjects.append(viewObject)
         }
         return viewObjects
     }
 }
 */
