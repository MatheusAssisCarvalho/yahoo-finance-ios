//
//  SummaryCell.swift
//  yahoo-finance-ios
//
//  Created by PEDRO GALDIANO DE CASTRO on 15/02/22.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var venda: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var compra: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        name.text = "Uma empresa Legal"
        compra.text = "500,00"
        venda.text = "450,00"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
