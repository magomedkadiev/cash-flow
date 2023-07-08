import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    var operations: [OperationPO]?
    var expenses: [ExpensePO] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OperationCreationViewController" {
           let _ = segue.destination as? OperationCreationViewController
        }
    }
}

extension OperationsViewController: ExpenseListAlertControllerHandler {
    
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
            return 180
        default:
            return 80
        }
    }
}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (operations?.count ?? 0) + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "exprenseListTableViewCell", for: indexPath) as? ExprenseListTableViewCell else {
                return UITableViewCell()
            }
            cell.viewController = self
            cell.alertControllerHandler = self
            cell.expenses = expenses
            cell.collectionView.reloadData()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "incomeListTableViewCell", for: indexPath) as? IncomeListTableViewCell else {
                return UITableViewCell()
            }
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
