import UIKit

class CategoryTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationCategoryViewObject else {
            return
        }
        categoryNameLabel.text = viewObject.name
    }

}
