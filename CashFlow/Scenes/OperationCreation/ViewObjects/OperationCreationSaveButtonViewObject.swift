import Foundation

struct OperationCreationSaveButtonViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "saveButtonTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = .saveButton
}
