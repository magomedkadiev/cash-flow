import UIKit

class OperationCreationWalletCategoryTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var walletNameLabel: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationWalletCategoryViewObject else {
            return
        }
        walletNameLabel.text = viewObject.name
    }

}
