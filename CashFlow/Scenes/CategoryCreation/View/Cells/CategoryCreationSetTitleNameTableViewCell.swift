import UIKit

class CategoryCreationSetTitleNameTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var titleNameTextField: UITextField!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? CategoryCreationSetTitleNameViewObject else {
            return
        }
        titleNameTextField.text = viewObject.titleName
    }

}
