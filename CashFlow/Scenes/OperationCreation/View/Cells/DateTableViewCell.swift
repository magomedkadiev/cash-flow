import UIKit

class DateTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var handler: OperationCreationDatePickerChangedHandler?
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? OperationCreationDateViewObject else {
            return
        }
        datePicker.date = viewObject.date
    }

    @IBAction func datePickerDidChanged(_ sender: UIDatePicker) {
        handler?.valueChanged(date: sender.date)
    }
}
