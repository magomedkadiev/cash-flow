import UIKit

class CategoryListTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var nameLabelText: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationCategoryViewObject else {
            return
        }
        nameLabelText.text = viewObject.name
    }

}
