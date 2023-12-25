import Foundation

class SettingsPresenter {
    
    weak var view: SettingsInputViewProtocol?
    var interactor: SettingsInteractor
    var router: ApplicationRouter
    
    init(view: SettingsInputViewProtocol, interactor: SettingsInteractor, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SettingsPresenter: SettingsOutputViewProtocol {
    
    func viewDidLoad() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        
        var firstSection = [CashFlowTableViewCellViewObject]()
        
        let categoryViewObject = SettingsCategoryViewObject(title: "Категории")
        
        firstSection.append(categoryViewObject)
        viewObjects.append(firstSection)
        view?.showInfo(viewObjects)
    }
    
    func didSelectRow(_ viewObject: CashFlowTableViewCellViewObject) {
        let rowType = viewObject.cellType
        switch rowType {
        case .settingCategory:
            router.openCategoryList()
        default:
            return
        }
    }
}

extension SettingsPresenter: SettingsInteractorOutputViewProtocol {
    
}
