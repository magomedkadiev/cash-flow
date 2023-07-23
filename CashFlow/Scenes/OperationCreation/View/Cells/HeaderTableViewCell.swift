import UIKit

class HeaderTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var totalSumTextFiled: UITextField!
    @IBOutlet weak var displayTextLabel: UILabel!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }

}
