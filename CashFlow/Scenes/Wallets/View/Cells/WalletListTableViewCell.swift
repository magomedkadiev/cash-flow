import UIKit

class WalletListTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var nameLabelText: UILabel!
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationWalletCategoryViewObject else {
            return
        }
        nameLabelText.text = viewObject.name
    }

}
