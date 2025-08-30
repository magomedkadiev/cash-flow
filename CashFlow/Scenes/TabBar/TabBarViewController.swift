import UIKit

class TabBarViewController: UITabBarController {
    
    let router: ApplicationRouter = Router()
    private var lastSelectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setUpViewControllers()
    }
    
    private func setUpViewControllers() {
        let operationsViewController = OperationsViewController.controller()
//        operationsViewController.tabBarItem.title = "Операции"
        
        let operationCreationViewController = OperationCreationViewController.controller()
        operationCreationViewController.tabBarItem.title = ""

        let settingsViewController = SettingsViewController.controller()
//        settingsViewController.tabBarItem.title = "Настройки"
        
        let analyticsViewController = AnalyticsViewController.controller()
        analyticsViewController.tabBarItem.title = "Аналитика"
        
        viewControllers = [operationsViewController, operationCreationViewController, settingsViewController]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 1 {
            router.openOperationCreationScreen(nil)
            selectedIndex = lastSelectedIndex
        }
        lastSelectedIndex = selectedIndex
    }
}
