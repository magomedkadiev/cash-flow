import Foundation
import UIKit

class Router: ApplicationRouter {
    
    func openCategoryList(_ viewObject: CashFlowTableViewCellViewObject?) {
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            // From current hierarchy
            if let navigationController = topController as? UINavigationController {
                if let operationCreationViewController = navigationController.topViewController as? OperationCreationViewController {
                    let categoryListViewController = CategoryListViewController.controller()
                    if let topViewController = categoryListViewController.topViewController as? CategoryListViewController {
                        topViewController.handler = operationCreationViewController
                        topViewController.operationViewObject = viewObject
                        operationCreationViewController.present(categoryListViewController, animated: true)
                    }
                }
            } // From settings scene
            else if let navigationController = (topController as? UITabBarController)?.selectedViewController as? UINavigationController {
                let categoryListViewController = CategoryListViewController.controller()
                navigationController.present(categoryListViewController, animated: true)

            }
        }
    }
    
    func openOperationCreationScreen(_ viewObject: CashFlowTableViewCellViewObject?) {
        guard let applicationTabBarController = Router.getTabBarViewController() else {
            return
        }
        if let navigationController = applicationTabBarController.selectedViewController as? UINavigationController {
            if let operationsViewController = navigationController.topViewController as? OperationsViewController {
                
                let operationCreationNavigationViewController = OperationCreationViewController.controller()
                
                if let topViewController = operationCreationNavigationViewController.topViewController as? OperationCreationViewController {
                    topViewController.operationCreationFinishHandler = operationsViewController
                    topViewController.operationViewObject = viewObject
                    operationsViewController.present(operationCreationNavigationViewController, animated: true)
                }
                
            } else if let navCon = applicationTabBarController.selectedViewController as? UINavigationController {
                if let operationsViewController = (applicationTabBarController.viewControllers?[0] as? UINavigationController)?.topViewController as? OperationsViewController {
                    
                    let operationCreationNavigationViewController = OperationCreationViewController.controller()

                    if let topViewController = operationCreationNavigationViewController.topViewController as? OperationCreationViewController {
                        topViewController.operationCreationFinishHandler = operationsViewController
                        navCon.present(operationCreationNavigationViewController, animated: true)
                    }
                    
                }
            }
        }
    }
    
    func dismiss() {
        
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
                if let navigationController = topController as? UINavigationController {
                    navigationController.dismiss(animated: true)
                }
            }
        }
    }
    
    func getChildrenViewController() -> UIViewController? {
        
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first

        if let topController = keyWindow?.rootViewController?.presentedViewController {
            if let navigationController = topController as? UINavigationController {
                return navigationController.topViewController
            }
        }
        return nil
    }
    
    func openCategoryCreationScreen(_ viewObject: CashFlowTableViewCellViewObject?) {
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if let navigationController = topController as? UINavigationController {
                if let categoryListViewController = navigationController.topViewController as? CategoryListViewController {
                    let categoryCreationViewController = CategoryCreationViewController.controller()
                    if let topViewController = categoryCreationViewController.topViewController as? CategoryCreationViewController {
                        topViewController.categoryCreationFinishHandler = categoryListViewController
                        topViewController.categoryViewObject = viewObject
                        categoryListViewController.present(categoryCreationViewController, animated: true)
                    }
                }
            }
        }
    }
    
    func openCategoryParentList() {
        let keyWindow = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 })
            .first?.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if let navigationController = topController as? UINavigationController {
                if let categoryCreationViewController = navigationController.topViewController as? CategoryCreationViewController {
                    let categoryParentListViewController = CategoryParentListViewController.controller()
                    if let topViewController = categoryParentListViewController.topViewController as? CategoryParentListViewController {
                        topViewController.handler = categoryCreationViewController
                        categoryCreationViewController.present(categoryParentListViewController, animated: true)
                    }
                } else if let categoryListViewController = navigationController.topViewController as? CategoryListViewController {
                    let categoryParentListViewController = CategoryParentListViewController.controller()
                    if let topViewController = categoryParentListViewController.topViewController as? CategoryParentListViewController {
                        topViewController.doesOpenForEditing = true
                        topViewController.closeHandler = categoryListViewController
                        categoryListViewController.present(categoryParentListViewController, animated: true)
                    }
                }
            }
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
