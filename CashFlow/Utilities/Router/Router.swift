import Foundation
import UIKit

class Router: ApplicationRouter {
    
    func openCategoryList() {
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if let navigationController = topController as? UINavigationController {
                if let operationCreationViewController = navigationController.topViewController as? OperationCreationViewController {
                    let categoryListViewController = CategoryListViewController.controller()
                    operationCreationViewController.present(categoryListViewController, animated: true)
                }
            }
        }
    }
    
    func openOperationCreationScreen() {
        guard let applicationTabBarController = Router.getTabBarViewController() else {
            return
        }
        if let navigationController = applicationTabBarController.selectedViewController as? UINavigationController {
            let operationCreationViewController = OperationCreationViewController.controller()
            navigationController.present(operationCreationViewController, animated: true)
        }
    }
    
}

extension Router {
    class fileprivate func getTabBarViewController() -> UITabBarController? {

        let rootViewController = UIApplication.shared.connectedScenes
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows.first?.rootViewController

        if let tabbarController = rootViewController as? UITabBarController {
            return tabbarController
        } else if let navigationController = rootViewController as? UINavigationController {
            for viewController in navigationController.viewControllers {
                if viewController.isKind(of: UITabBarController.self) {
                    return viewController as? UITabBarController
                }
            }
        }
        return rootViewController as? UITabBarController
    }
}
