import UIKit

class HeaderTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    weak var handler: OperationCreationSegmentedControllHandler?
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        
        guard let viewObject = viewObject as? OperationCreationHeaderViewObject else {
            return
        }
        let index = viewObject.type == .expense ? 0 : 1
        segmentedControl.selectedSegmentIndex = index
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    @IBAction func segmentedControllValueChanged(_ sender: UISegmentedControl) {
        handler?.valueChanged(segmentedIndex: sender.selectedSegmentIndex)
    }
    
}
