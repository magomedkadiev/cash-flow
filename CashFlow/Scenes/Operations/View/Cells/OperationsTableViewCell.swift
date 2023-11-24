import UIKit

class OperationsTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var sumLabelText: UILabel!
    @IBOutlet weak var categoryNameLabelText: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        
        guard let viewObject = viewObject as? OperationViewObject else {
            return
        }
        
        categoryNameLabelText.text = viewObject.categoryName
        sumLabelText.text = "- \(viewObject.totalAmount) ₽"
    }
}
