import UIKit

class TabBarViewController: UITabBarController, UIAdaptivePresentationControllerDelegate {
    
    let router: ApplicationRouter = Router()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == TabControllersConst.add {
            router.openOperationCreationScreen()
            return false
        }
        return true
    }
}

private struct TabControllersConst {
    static let operations = 0
    static let add = 1
    static let settings = 2
}
