import Foundation

class CategoryCreationConfigurator {
    
    func configure(_ viewController: CategoryCreationViewController) {
        let router: ApplicationRouter = Router()
        let categoryRealmDAO: CategoryDAO = CategoryRealmDAO()
        let interactor = CategoryCreationInteractor(categoryRealmDAO: categoryRealmDAO)
        let templateViewObject = CategoryCreationTemplateViewObject(name: "",
                                                                    parentCategoryName: "",
                                                                    parentID: "")
        let templateViewObjectMapper = CategoryCreationToCategoryCreationTemplateViewObjectMapper()
        let presenter = CategoryCreationPresenter(view: viewController, router: router, interactor: interactor, templateViewObject: templateViewObject, templateViewObjectMapper: templateViewObjectMapper)
        viewController.presenter = presenter
        interactor.presenter = presenter
    }
}
