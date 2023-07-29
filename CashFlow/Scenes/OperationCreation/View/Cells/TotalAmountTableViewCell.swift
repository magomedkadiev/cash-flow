import UIKit

class TotalAmountTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var displayTextField: UITextField!
    @IBOutlet weak var displayLabelText: UILabel!
        
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let _ = viewObject as? OperationCreationTotalAmountViewObject else {
            return
        }
        displayTextField.becomeFirstResponder()
    }

}
