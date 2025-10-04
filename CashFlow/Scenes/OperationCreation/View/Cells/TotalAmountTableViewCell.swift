import UIKit

class TotalAmountTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var displayTextField: UITextField!
        
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationTotalAmountViewObject else {
            return
        }
        displayTextField.text = viewObject.totalAmount == 0 ? "" : "\(viewObject.totalAmount.groupedFormStyle())"
    }

}
