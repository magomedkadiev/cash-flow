import Foundation

class OperationsInitializer: NSObject {
    
    @IBOutlet weak var viewController: OperationsViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = OperationsConfigurator()
        configurator.configureWith(viewController)
    }
}
