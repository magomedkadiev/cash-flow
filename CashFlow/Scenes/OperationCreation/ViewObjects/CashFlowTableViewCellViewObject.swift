import Foundation

protocol CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat { get }
    var reuseIdentifier: String { get }
    var cellType: CashFlowTableViewCellTypeProtocol { get }
}

protocol CashFlowTableViewCellProtocol {
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath)
}

enum CashFlowTableViewCellTypeProtocol {
    case categoryButton
    case saveButton
    case _default
    case settingCategory
    case categoryCreationParent
    case categoryCreationSetTitleName
}
