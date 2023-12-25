import UIKit

class SettingsTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? SettingsCategoryViewObject else {
            return
        }
        categoryTitleLabel.text = viewObject.title
    }

}
