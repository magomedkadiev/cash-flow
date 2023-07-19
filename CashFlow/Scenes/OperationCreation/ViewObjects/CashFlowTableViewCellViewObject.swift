import Foundation

protocol CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat { get }
    var reuseIdentifier: String { get }
}

protocol CashFlowTableViewCellProtocol {
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath)
}
