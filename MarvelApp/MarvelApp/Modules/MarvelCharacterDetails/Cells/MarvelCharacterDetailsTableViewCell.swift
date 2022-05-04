//
//  MarvelCharacterDetailsTableViewCell.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 04/05/22.
//

import UIKit
import SDWebImage

class MarvelCharacterDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var marvelImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(url: String?, title: String?, description: String?) {
        if let imageUrl = url {
            let placeholder =  UIImage(named: "dummyImage", in: nil, with: nil)
             let httpsUrl = "https" + imageUrl.dropFirst(4)
             marvelImage.contentMode = .scaleToFill
             marvelImage.sd_setImage(with: URL(string: httpsUrl), placeholderImage: placeholder)
        } else {
            marvelImage.image = UIImage(named: "dummyImage", in: nil, with: nil)
        }
        
        self.marvelImage.layer.cornerRadius = 10
        self.titleLabel.text = title
        self.discriptionLabel.text = description
    }
}
