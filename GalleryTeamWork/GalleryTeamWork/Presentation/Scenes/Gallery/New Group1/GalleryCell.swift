//
//  GalleryCell.swift
//  GalleryTeamWork
//
//  Created by Tiko on 06.07.21.
//

import UIKit
import Kingfisher

class GalleryCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var galleryImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(with imageUrl: String) {
        let url = URL(string: imageUrl)
        self.galleryImage.kf.indicatorType = .activity
        self.galleryImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
