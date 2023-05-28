//
//  ActionsTableViewCell.swift
//  CashFlow
//
//  Created by Султанхан on 28.05.2023.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var exprenseButton: UIButton!
    @IBOutlet weak var incomeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
