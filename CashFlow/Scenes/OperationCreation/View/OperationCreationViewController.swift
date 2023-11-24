import UIKit

class OperationCreationViewController: UIViewController {
    
    var presenter: OperationCreationOutputViewProtocol?
    
    private var totalAmount: String = ""
    
    var categoryViewObject: OperationCreationCategoryViewObject?
        
    var viewObjects: [[CashFlowTableViewCellViewObject]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var operationCreationFinishHandler: OperationCreationFinishHandler?
    
    @IBOutlet weak var tableView: UITableView!
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "OperationCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    fileprivate func updateDisplayTextLabelWhenTotalAmountChanged(with text: String) {
        let visibleCells = tableView.visibleCells
        
        for cell in visibleCells {
            if let cell = cell as? TotalAmountTableViewCell {
                cell.displayLabelText.text = totalAmount + " ₽"
            }
        }
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
        
        let selectedViewObject = viewObjects[indexPath.section][indexPath.row]
        presenter?.eventItemSelected(selectedViewObject, totalAmount: totalAmount)
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
        let shouldChangeCharacters = text.count <= 7
        if shouldChangeCharacters {
            totalAmount = text
            updateDisplayTextLabelWhenTotalAmountChanged(with: totalAmount)
        }
        return shouldChangeCharacters
    }
}

extension OperationCreationViewController: OperationCreationSelectionHandler {
    
    func handler(viewObject: CashFlowTableViewCellViewObject) {
        presenter?.configureSelected(viewObject: viewObject)
    }
}
