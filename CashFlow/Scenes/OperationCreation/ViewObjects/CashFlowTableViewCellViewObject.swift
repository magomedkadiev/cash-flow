import Foundation

protocol CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat { get }
    var reuseIdentifier: String { get }
    var sectionItem: Int { get }
}

protocol CashFlowTableViewCellProtocol {
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath)
}
