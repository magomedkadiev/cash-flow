import UIKit

class OperationCreationViewController: UIViewController {
    
    var presenter: OperationCreationOutputViewProtocol?
    
    private var sum: Int = 0
    
    var operationViewObject: CashFlowTableViewCellViewObject?
        
    var viewObjects: [[CashFlowTableViewCellViewObject]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var operationCreationFinishHandler: OperationCreationFinishHandler?
    
    @IBOutlet weak var closeBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "OperationCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(operationViewObject)
    }
    
    fileprivate func updateDisplayTextLabelWhenTotalAmountChanged() {
        let visibleCells = tableView.visibleCells
        
        for cell in visibleCells {
            if let cell = cell as? TotalAmountTableViewCell {
                cell.displayLabelText.text = sum.toMoneyStyle()
            }
        }
    }
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension OperationCreationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewObjects[section]
        return section.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section][indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            
            switch cell {
            case let headerCell as HeaderTableViewCell:
                headerCell.handler = self
            case let dateCell as DateTableViewCell:
                dateCell.handler = self
            case let commentCell as CommentTableViewCell:
                commentCell.handler = self
            default:
                break
            }
            
            cell.setup(with: viewObject, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}

extension OperationCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = viewObjects[indexPath.section][indexPath.row].cellType
        presenter?.didSelectRowAt(type)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TotalAmountTableViewCell else {
            return
        }
        DispatchQueue.main.async {
            cell.displayTextField.becomeFirstResponder()
        }
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
    }
    
    func operationCreationFinished() {
        operationCreationFinishHandler?.finishHandled()
    }
}

extension OperationCreationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let shouldChangeCharacters = text.count <= 8
        if shouldChangeCharacters {
            sum = Int(text) ?? 0
            presenter?.totalAmountValueChanged(totalAmount: Int(text) ?? 0)
            updateDisplayTextLabelWhenTotalAmountChanged()
        }
        return shouldChangeCharacters
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if ((textField.text?.starts(with: "0")) != nil) {
            textField.text = ""
        }
        return true
    }
}

extension OperationCreationViewController: CategoryListSelectionHandler {
    
    func updateSelectedCategoryObject(_ viewObject: CashFlowTableViewCellViewObject) {
        // update
        presenter?.configureSelected(viewObject: viewObject)
    }
}

extension OperationCreationViewController: OperationCreationDatePickerChangedHandler {
    
    func valueChanged(date: Date) {
        presenter?.datePickerValueChanged(date: date)
    }
}

extension OperationCreationViewController: OperationCreationSegmentedControllHandler {
    
    func valueChanged(segmentedIndex: Int) {
        presenter?.segmentedControlValueChanged(segmentedIndex)
    }
}

extension OperationCreationViewController: OperationCreationCommentHandler {
    
    func valueChanged(_ text: String) {
        presenter?.commentValueChanged(text)
    }
}
