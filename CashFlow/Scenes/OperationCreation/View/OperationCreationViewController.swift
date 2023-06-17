import UIKit

class OperationCreationViewController: UIViewController {

    
    var presenter: OperationCreationOutputViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
}
