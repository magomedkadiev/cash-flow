import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryListOutputViewProtocol?
    var viewObjects = [CategoryListViewObject]()
    weak var handler: CategoryListSelectionHandler?
    var operationViewObject: CashFlowTableViewCellViewObject?
    
    @IBOutlet weak var moveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!

    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCloseButtonIfNeeded()
        presenter?.viewDidLoad()
        
        tableView.tableFooterView = nil
        tableView.sectionFooterHeight = 0.0
    }
     
    @IBAction func addBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presenter?.addButtonTapped()
    }
    @IBAction func moveBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presenter?.reorderCategoriesButtonTapped()
    }
    
    private func configureCloseButtonIfNeeded() {
        if shouldShowCloseButton {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Add"),
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(closeTapped))
        }
    }
    
    private var shouldShowCloseButton: Bool {
        if let currentNavigationController = navigationController,
           currentNavigationController.presentingViewController != nil,
           currentNavigationController.viewControllers.first == self {
            return true
        }
        
        if presentingViewController != nil {
            return true
        }
        
        return false
    }
    
    @objc private func closeTapped() {
        self.dismiss(animated: true)
    }

}

extension CategoryListViewController: CategoryParentListCloseHandler {
    
    func didClose() {
        presenter?.fetchAllCategories()
    }
}

extension CategoryListViewController: CategoryListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        guard let viewObjects = viewObjects as? [CategoryListViewObject] else { return }
        self.viewObjects = viewObjects
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didSelectHandler(_ viewObject: CategoryListViewObject) {
        self.handler?.updateSelectedCategoryObject(viewObject)
    }
    
    func hideBarButtonItemIfNedeed(_ value: Bool) {
        addBarButtonItem.isHidden = value
    }
}

extension CategoryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewObjects[section].opened == true {
            return viewObjects[section].subCategories.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section]
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier) as? CashFlowTableViewCellProtocol else { return UITableViewCell() }
            
            if let headerCell = cell as? CategoryListTableViewCell {
               headerCell.handler = self
                if let operationViewObject = operationViewObject as? OperationViewObject {
                    headerCell.checkMarkImageView.isHidden = viewObject.id != operationViewObject.categoryID
                }
            }
            
            cell.setup(with: viewObject, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier) as? CashFlowTableViewCellProtocol else { return UITableViewCell() }
            
            if let underHeader = cell as? CategoryListTableViewCell {
                if let operationViewObject = operationViewObject as? OperationViewObject {
                    underHeader.checkMarkImageView.isHidden = viewObject.subCategories[indexPath.row - 1].id != operationViewObject.categoryID
                }
            }
            
            cell.setup(with: viewObject.subCategories[indexPath.row - 1], indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
            
        }
    }
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectItemEvent(viewObjects, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return viewObjects[indexPath.section].cellHeight
            
        }
        return viewObjects[indexPath.section].subCategories[indexPath.row - 1].cellHeight
    }
    
}

extension CategoryListViewController: CategoryListHeaderSelectionHandler {
    func expandedCellsButtonTapped(_ sender: UIButton) {
        let point = tableView.convert(CGPointZero, from: sender)
        if let indexPath = tableView.indexPathForRow(at: point) {
            if viewObjects[indexPath.section].opened == true {
                viewObjects[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                viewObjects[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)

            }
        }
    }
}
extension CategoryListViewController: CategoryCreationFinishHandler {
    
    func finishHandled() {
        presenter?.fetchAllCategories()
    }
}
