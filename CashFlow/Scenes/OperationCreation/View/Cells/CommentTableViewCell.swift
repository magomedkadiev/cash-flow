import UIKit

class CommentTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var commentTextField: UITextField!
    
    weak var handler: OperationCreationCommentHandler?
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        
        guard let viewObject = viewObject as? OperationCreationCommentViewObject else {
            return
        }
        commentTextField.text = viewObject.comment
    }
}

extension CommentTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let shouldChangeCharacters = text.count <= 50
        if shouldChangeCharacters {
            handler?.valueChanged(text)
        }
        return shouldChangeCharacters
    }
}
