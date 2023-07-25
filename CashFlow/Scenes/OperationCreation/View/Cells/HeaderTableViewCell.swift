import UIKit

class HeaderTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }

}
