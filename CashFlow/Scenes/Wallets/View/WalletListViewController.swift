import UIKit

class WalletListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewObjects = [CashFlowTableViewCellViewObject]()
    var presenter: WalletListOutputViewProtocol?
    weak var handler: OperationCreationCategoryHandler?
    
    static func controller() -> WalletListViewController {
        let storyboard = UIStoryboard(name: "WalletList", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WalletListViewController") as! WalletListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension WalletListViewController: WalletListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        self.viewObjects = viewObjects
        tableView.reloadData()
    }
}

extension WalletListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier, for: indexPath) as? CashFlowTableViewCellProtocol {
            cell.setup(with: viewObject, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}

extension WalletListViewController: UITableViewDelegate {
    
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
