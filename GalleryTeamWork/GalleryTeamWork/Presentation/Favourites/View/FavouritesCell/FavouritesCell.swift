//
//  FavouritesCell.swift
//  GalleryTeamWork
//
//  Created by Mac User on 7/6/21.
//

import UIKit

class FavouritesCell: UICollectionViewCell {

    @IBOutlet weak var favouriteImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with image: UIImage) {
        favouriteImg.image = image
    }
    
}
