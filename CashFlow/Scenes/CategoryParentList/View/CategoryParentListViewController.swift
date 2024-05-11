import UIKit

class CategoryParentListViewController: UIViewController {

    var presenter: CategoryParentListOutputViewProtocol?
    @IBOutlet weak var tableView: UITableView!
    var viewObjects = [CashFlowTableViewCellViewObject]()
    weak var handler: CategoryParentListSelectionHandler?
    weak var closeHandler: CategoryParentListCloseHandler?
    
    var doesOpenForEditing: Bool = false
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryParentList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        navigationController?.presentationController?.delegate = self

        tableView.isEditing = doesOpenForEditing
    }
}

extension CategoryParentListViewController: CategoryParentListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        self.viewObjects = viewObjects
    }
}

extension CategoryParentListViewController: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        closeHandler?.didClose()
    }
    
}

extension CategoryParentListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier, for: indexPath) as? CashFlowTableViewCellProtocol else {
            return UITableViewCell()
        }
        cell.setup(with: viewObject, indexPath: indexPath)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter?.moveRow(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

extension CategoryParentListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewObject = viewObjects[indexPath.row]
        handler?.didSelect(viewObject)
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            presenter?.didDeleteButtonTapped(viewObjects[indexPath.row])
            viewObjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
}
