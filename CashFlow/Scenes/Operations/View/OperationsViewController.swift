import UIKit

class OperationsViewController: UIViewController {

    @IBOutlet weak var monthlyExpenseTextLabel: UILabel!
    @IBOutlet weak var monthlyIncomeTextLabel: UILabel!
    
    var presenter: OperationsOutputViewProtocol?
    
    private let triggerPullHeight: CGFloat = 44
    private var armed = false
    private let haptics = UIImpactFeedbackGenerator(style: .rigid)
    
    private let indicatorSize: CGFloat = 26
    private let indicatorReveal: CGFloat = 24
    private let indicatorImage = UIImageView(image: UIImage(systemName: "plus.circle.fill"))

    private var indicatorTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!

    var operationSectionObjects = [OperationSectionObject]()
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Operations", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = nil
        presenter?.viewDidLoad()
        setupIndicator()
    }
    
    private func openCreationScene() {
        presenter?.eventBeginFerfeshing()
    }
    
    private func setupIndicator() {
        indicatorImage.translatesAutoresizingMaskIntoConstraints = false
        indicatorImage.tintColor = .systemGray
        indicatorImage.contentMode = .scaleAspectFit

        view.addSubview(indicatorImage)

        indicatorTopConstraint = indicatorImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                                     constant: -(indicatorSize/2))
        NSLayoutConstraint.activate([
            indicatorTopConstraint,
            indicatorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorImage.widthAnchor.constraint(equalToConstant: indicatorSize),
            indicatorImage.heightAnchor.constraint(equalToConstant: indicatorSize)
        ])

        indicatorImage.alpha = 0
        indicatorImage.isUserInteractionEnabled = false
    }
    
    private func updateIndicator(pull: CGFloat) {
        let reveal = min(indicatorReveal, pull)
        let progress = min(1, pull / triggerPullHeight)

        indicatorTopConstraint.constant = -(indicatorSize/2) + reveal
        indicatorImage.alpha = progress == 0 ? 0 : (0.2 + 0.8 * progress)

        view.layoutIfNeeded()
    }
}

extension OperationsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topInset = scrollView.adjustedContentInset.top
        let pull = max(0, -(scrollView.contentOffset.y + topInset))

        updateIndicator(pull: pull)

        guard scrollView.isDragging else { return }

        if pull >= triggerPullHeight {
            if !armed {
                armed = true
                haptics.impactOccurred()
                UIView.animate(withDuration: 0.12) {
                    self.indicatorImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                } completion: { _ in
                    UIView.animate(withDuration: 0.12) {
                        self.indicatorImage.transform = .identity
                    }
                }
            }
        } else if armed {
            armed = false
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate: Bool) {
        guard armed else { return }
        armed = false
        openCreationScene()
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    
    func showInfo(_ operationSectionObjects: [OperationSectionObject], totalExpense: Int, totalIncome: Int) {
        self.operationSectionObjects = operationSectionObjects
        self.monthlyExpenseTextLabel.text = totalExpense.toMoneyStyle()
        self.monthlyIncomeTextLabel.text = totalIncome.toMoneyStyle()

        self.tableView.reloadData()
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let operationViewObject = operationSectionObjects[indexPath.section].operations[indexPath.row]
        presenter?.didSelectItemEvent(operationViewObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return operationSectionObjects[indexPath.section].operations[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionObject = operationSectionObjects[section]
        return sectionObject.date.toString() + "      " + sectionObject.balancePerDay.toMoneyStyle()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return operationSectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operationSectionObjects[section].operations.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let operation = operationSectionObjects[indexPath.section].operations[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: operation.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            cell.setup(with: operation, indexPath: indexPath)
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
