import UIKit

class WalletTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var viewController: OperationsViewController? = nil
    weak var alertControllerHandler: WalletAlertControllerHandler?
    var expenses: [ExpensePO] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    fileprivate func presentAlertController() {
        let alertController = UIAlertController(title: "Добавление дохода", message: "Назовите ваш новый источник дохода", preferredStyle: .alert)
        let append = UIAlertAction(title: "Сохранить", style: .default) { [weak alertController] _ in
            if let textFiled = alertController?.textFields![0] {
                if let expenseName = textFiled.text {
                    self.alertControllerHandler?.createNewExpenseWith(name: expenseName)
                }
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addTextField()
        alertController.addAction(append)
        alertController.addAction(cancel)
        viewController?.present(alertController, animated: true)
    }
}

extension WalletTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expenses.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case expenses.count:
            print(expenses.count, indexPath.row)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walletCollectionAddViewCell", for: indexPath) as? WalletCollectionAddViewCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walletCollectionViewCell", for: indexPath) as? WalletCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.nameTextLabel.text = expenses[indexPath.row].name
            cell.sumTextLabel.text = "\(expenses[indexPath.row].totalValue) ₽"
            return cell
        }
    }
}

extension WalletTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case expenses.count:
            presentAlertController()
        default:
            break
        }
    }
}

extension WalletTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
