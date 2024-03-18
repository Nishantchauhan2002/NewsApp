//
//  BannerCollectionViewCell.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 12/03/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    func setUpCell(viewmodel:BannerModel){
        
        self.bannerImage.sd_setImage(with: URL(string: viewmodel.bannerImage ?? "https://static.foxnews.com/foxnews.com/content/uploads/2024/03/GettyImages-1708450773.jpg" ))
        self.titleLabel.text = viewmodel.title
    }

}
