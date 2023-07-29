import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryListOutputViewProtocol?
    var viewObjects = [CashFlowTableViewCellViewObject]()
    weak var handler: OperationCreationSelectionHandler?

    static func controller() -> CategoryListViewController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CategoryListViewController: CategoryListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        self.viewObjects = viewObjects
        tableView.reloadData()
    }
}

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            cell.setup(with: viewObject, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewObject = viewObjects[indexPath.row]
        handler?.handler(viewObject: viewObject)
        presenter?.dismissViewController(with: viewObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.row]
        return viewObject.cellHeight
    }
}
