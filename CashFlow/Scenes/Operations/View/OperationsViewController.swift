import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    var operations: [OperationPO]?
    var expenses: [ExpensePO] = []
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupRefreshControll()
    }
    
    private func setupRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refreshingHasStarted(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refreshingHasStarted(sender: UIRefreshControl) {
        self.performSegue(withIdentifier: "OperationCreationViewController", sender: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.refreshControl.endRefreshing()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OperationCreationViewController" {
           let _ = segue.destination as? OperationCreationViewController
        }
    }
}

extension OperationsViewController: WalletAlertControllerHandler {
    
    func createNewExpenseWith(name: String) {
        presenter?.createNewExpenseButtonTappedWith(expenseName: name)
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    
    func refreshTableView(operations: [OperationPO]) {
        self.operations = operations
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func refreshTableView(expenses: [ExpensePO]) {
        self.expenses = expenses
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0,1:
            return 220
        default:
            return 80
        }
    }
}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (operations?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "walletTableViewCell", for: indexPath) as? WalletTableViewCell else {
                return UITableViewCell()
            }
            cell.viewController = self
            cell.alertControllerHandler = self
            cell.expenses = expenses
            cell.collectionView.reloadData()
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "operationTableCell", for: indexPath) as? OperationTableViewCell else {
                return UITableViewCell()
            }
            cell.nameLabel.text = "Операция - \(indexPath.row + 1)"//operations![indexPath.row-2].category
            return cell
        }
    }
}
