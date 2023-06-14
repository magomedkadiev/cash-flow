import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    var operations: [OperationPO]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter?.viewDidLoad()
    }

    @IBAction func addNewOperation(_ sender: UIButton) {
        presenter?.addNewOperationButtonTapped(sender.tag)
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    func refreshTableView(operations: [OperationPO]) {
        self.operations = operations
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
        case 0:
            return 100
        case 1:
            return 100
        default:
            return 60
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "totalBalance", for: indexPath) as? TotalBalanceTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "actionsTableCell", for: indexPath) as? ActionsTableViewCell else {
                return UITableViewCell()
            }
            return cell

        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "operationTableCell", for: indexPath) as? OperationTableViewCell else {
                return UITableViewCell()
            }
            cell.nameLabel.text = operations![indexPath.row-2].name
            return cell
        }
    }
}
