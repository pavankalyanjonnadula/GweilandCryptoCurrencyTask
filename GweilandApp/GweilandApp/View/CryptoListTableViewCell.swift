//
//  CryptoListTableViewCell.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 16/11/23.
//

import UIKit

class CryptoListTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolId: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var gainGraphImage: UIImageView!
    @IBOutlet weak var symbolName: UILabel!
    
    @IBOutlet weak var precentChange: UILabel!
    @IBOutlet weak var coinrateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
