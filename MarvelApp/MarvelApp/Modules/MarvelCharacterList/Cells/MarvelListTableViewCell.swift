//
//  MarvelListTableViewCell.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 28/04/22.
//

import UIKit
import SDWebImage

class MarvelListTableViewCell: UITableViewCell {

    @IBOutlet weak var marvelImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
  
    
    private var _imageUrl = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        marvelImage.image =  nil
        descriptionLabel.text = nil
    }
}

extension MarvelListTableViewCell: MarvelCharacterListCellProtocol {
    func configureCell(character: MarvelCharacterLite) {
        titleLabel.text = character.name
        descriptionLabel.text = character.description
        if let path = character.thumbnail?.path,
           let ext = character.thumbnail?.thumbnailExtension {
            //this can be processed in service layer
           let placeholder =  UIImage(named: "dummyImage", in: nil, with: nil)
            let imageUrl = "\(path).\(ext)"
            let httpsUrl = "https" + imageUrl.dropFirst(4)
            marvelImage.contentMode = .scaleToFill
            marvelImage.layer.cornerRadius = 10
            marvelImage.sd_setImage(with: URL(string: httpsUrl), placeholderImage: placeholder)
        }
    }
}
