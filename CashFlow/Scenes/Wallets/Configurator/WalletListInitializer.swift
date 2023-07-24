import Foundation

class WalletListInitializer: NSObject {
    
    @IBOutlet weak var viewController: WalletListViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = WalletListConfigurator()
        configurator.configure(with: viewController)
    }
}
