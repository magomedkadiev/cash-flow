import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryListOutputViewProtocol?
    var viewObjects = [CategoryListViewObject]()
    weak var handler: CategoryListSelectionHandler?
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    private let headerID = String(describing: CategoryListHeaderView.self)
    private var isEdited: Bool {
        get {
            return presenter?.isReadyForEditing() ?? false
        }
    }

    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addBarButtonItem.isHidden = !isEdited
        presenter?.viewDidLoad()
    }
    
    private func configureTableView() {
        let nib = UINib(nibName: headerID, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func addBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presenter?.addButtonTapped()
    }
    
}

extension CategoryListViewController: CategoryListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        guard let viewObjects = viewObjects as? [CategoryListViewObject] else { return }
        self.viewObjects = viewObjects
        tableView.reloadData()
    }
}

extension CategoryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard viewObjects[section].isExpanded else {
            return 0
        }
        return viewObjects[section].subCategories.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? CategoryListHeaderView else {
            return UIView()
        }
        header.configure(title: viewObjects[section].name, section: section)
        header.rotateImage(viewObjects[section].isExpanded)
        header.handler = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section].subCategories[indexPath.row]

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
        var viewObject = viewObjects[indexPath.section].subCategories[indexPath.row]
        viewObject.isSelected = !viewObject.isSelected
        
        handler?.didSelect(viewObject)
        presenter?.dismissViewController(with: viewObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section].subCategories[indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let viewObject = viewObjects[section]
        return viewObject.cellHeight
    }
}

extension CategoryListViewController: CategoryListHeaderSelectionHandler {
    
    func expandedSection(_ button: UIButton) {
        let section = button.tag
        let isExpanded = viewObjects[section].isExpanded
        viewObjects[section].isExpanded = !isExpanded
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}

extension CategoryListViewController: CategoryCreationFinishHandler {
    
    func finishHandled() {
        presenter?.fetchAllCategories()
    }
}
