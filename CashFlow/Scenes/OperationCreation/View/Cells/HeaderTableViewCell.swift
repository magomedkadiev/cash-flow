//
//  OperationCreationHeaderTableViewCell.swift
//  CashFlow
//
//  Created by Султанхан on 12.07.2023.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var totalSumTextFiled: UITextField!
    @IBOutlet weak var displayTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalSumTextFiled.becomeFirstResponder()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
