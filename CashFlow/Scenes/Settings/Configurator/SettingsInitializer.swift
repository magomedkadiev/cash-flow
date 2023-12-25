import Foundation

class SettingsInitializer: NSObject {
    
    @IBOutlet weak var viewController: SettingsViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = SettingsConfigurator()
        configurator.configure(viewController)
    }
}
