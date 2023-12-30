import UIKit

class CategoryCreationParentCategoryTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var parentCategoryLabelText: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? CategoryCreationParentCategoryViewObject else {
            return
        }
        parentCategoryLabelText.text = viewObject.parentCategoryTitleName
    }
}
