import UIKit

class TotalAmountTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var displayTextField: UITextField!
    @IBOutlet weak var displayLabelText: UILabel!
        
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationTotalAmountViewObject else {
            return
        }
//        displayTextField.becomeFirstResponder()
        displayLabelText.text = viewObject.totalAmount.toMoneyStyle()
        displayTextField.text = "\(viewObject.totalAmount)"
    }

}
