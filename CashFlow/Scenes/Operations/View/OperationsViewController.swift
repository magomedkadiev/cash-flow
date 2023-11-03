import UIKit

extension Date {
    
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
            let days1 = calendar.component(component, from: self)
            let days2 = calendar.component(component, from: date)
            return days1 - days2
        }
    
    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
           distance(from: date, only: component) == 0
       }
}

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
          preconditionFailure("Take a look to your format")
        }
        return date
      }
}

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
//    var viewObjects = [[CashFlowTableViewCellViewObject]]()
    var viewObjects = [Dictionary<Date, [OperationViewObject]>.Element]()//[Date: [CashFlowTableViewCellViewObject]]()
    
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
        presenter?.eventBeginFerfeshing()
        // TODO: make it without delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.refreshControl.endRefreshing()
        })
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    
    func showInfo(_ viewObjects: [Dictionary<Date, [OperationViewObject]>.Element]) {
        self.viewObjects = viewObjects
        self.tableView.reloadData()
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let viewObject = viewObjects[indexPath.section][indexPath.row]
        let section = Array(viewObjects)[indexPath.section]
        let object = section.value[indexPath.row]

        return object.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let tt = Array(viewObjects)[section].key
        return tt.toString()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(viewObjects)[section].value.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Array(viewObjects)[indexPath.section]
        let object = section.value[indexPath.row]
        
        

        if let cell = tableView.dequeueReusableCell(withIdentifier: object.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            cell.setup(with: object, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
        
    }
}

extension OperationsViewController: OperationCreationFinishHandler {
    
    func finishHandled() {
        presenter?.fetchAllOperations()
    }
}
