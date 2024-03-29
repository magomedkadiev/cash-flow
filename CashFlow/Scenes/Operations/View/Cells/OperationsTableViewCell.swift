import UIKit

class OperationsTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var sumLabelText: UILabel!
    @IBOutlet weak var categoryNameLabelText: UILabel!
    
    @IBOutlet weak var commentLabelText: UILabel!
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        
        guard let viewObject = viewObject as? OperationViewObject else {
            return
        }
        
        categoryNameLabelText.text = viewObject.categoryName
        
        let typeRaw = viewObject.type == .expense ? "- " : "+ "
        let sumText = typeRaw + viewObject.totalAmount.toMoneyStyle()
        sumLabelText.text = sumText
        commentLabelText.text = viewObject.comment
    }
}
