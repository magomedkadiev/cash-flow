import UIKit

class CategoryCreationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryCreationOutputViewProtocol?
    
    var viewObjects = [[CashFlowTableViewCellViewObject]]()
    
    weak var categoryCreationFinishHandler: CategoryCreationFinishHandler?
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    @IBAction func createCategoryTapped(_ sender: UIBarButtonItem) {
        presenter?.createCategoryWith()
    }
}

extension CategoryCreationViewController: CategoryCreationInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
        tableView.reloadData()
    }
    
    func categoryCreationFinished() {
        categoryCreationFinishHandler?.finishHandled()
    }
}

extension CategoryCreationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier, for: indexPath) as? CashFlowTableViewCellProtocol else {
            return UITableViewCell()
        }
        cell.setup(with: viewObject, indexPath: indexPath)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Родительская категория"
        }
        return ""
    }
}

extension CategoryCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectItemEvent(viewObject)
    }
}

extension CategoryCreationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let shouldChangeCharacters = text.count <= 30
        if shouldChangeCharacters {
            presenter?.updateCategoryName(text)
        }
        return shouldChangeCharacters
    }
}

extension CategoryCreationViewController: CategoryParentListSelectionHandler {
    
    func didSelect(_ viewObject: CashFlowTableViewCellViewObject) {
        presenter?.updateParentCategoryName(viewObject)
    }
}
