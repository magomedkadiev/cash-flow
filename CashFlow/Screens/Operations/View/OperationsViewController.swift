import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello Operations!")
    }

}

extension OperationsViewController: OperationsInputViewProtocol {
    
}
