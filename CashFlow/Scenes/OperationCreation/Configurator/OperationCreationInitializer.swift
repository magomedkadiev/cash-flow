import Foundation

class OperationCreationInitializer: NSObject {
    
    
    @IBOutlet weak var viewController: OperationCreationViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = OperationCreationConfigurator()
        configurator.configure(viewController: viewController)
    }
}
