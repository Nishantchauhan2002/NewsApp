//
//  BannerCollectionViewCell.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 12/03/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    func setUpCell(viewmodel:NewsTableCellModel){
        self.bannerImage.sd_setImage(with: URL(string: viewmodel.imageUrl ?? "" ))
    }

}
