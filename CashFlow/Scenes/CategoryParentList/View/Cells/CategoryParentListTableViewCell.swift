import UIKit

class CategoryParentListTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var categoryNameTextLabel: UILabel!
 
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? CategoryParentListViewObject else {
            return
        }
        categoryNameTextLabel.text = viewObject.name
    }
}
