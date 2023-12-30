import Foundation
import UIKit

protocol ApplicationRouter {
    func openCategoryList()
    func openOperationCreationScreen(_ viewObject: CashFlowTableViewCellViewObject?)
    func dismiss()
    func getChildrenViewController() -> UIViewController?
    func openCategoryCreationScreen(_ viewObject: CashFlowTableViewCellViewObject?)
    func openCategoryParentList()
}
