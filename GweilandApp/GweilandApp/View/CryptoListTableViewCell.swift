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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var precentChange: UILabel!
    @IBOutlet weak var coinrateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureLogo(with imageURL: URL) {
          // Start the activity indicator
          activityIndicator.startAnimating()

          // Use SDWebImage to load the image asynchronously
          coinImage.sd_setImage(with: imageURL) { [weak self] (image, error, _, _) in
              // Stop the activity indicator when the download is complete
              self?.activityIndicator.stopAnimating()
              self?.activityIndicator.isHidden = true
          }
      }

 
}
