import UIKit

class CategoryListTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var nameLabelText: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? CategoryListViewObject else {
            return
        }
        nameLabelText.text = viewObject.name
        checkMarkImageView.isHidden = !viewObject.isSelected
    }

}
