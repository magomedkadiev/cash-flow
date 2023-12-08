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
    case saveButton
    case categoryButton
    case _default
}
