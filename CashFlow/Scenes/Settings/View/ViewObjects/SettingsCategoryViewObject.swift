import Foundation

struct SettingsCategoryViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "SettingsTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = .settingCategory
    
    var title: String
}
