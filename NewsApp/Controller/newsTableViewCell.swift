//
//  newsTableViewCell.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 08/03/24.
//

import UIKit
import SDWebImage

class newsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsTbaleViewCellImage: UIImageView!
    @IBOutlet weak var newsTableViewcellHeadline: UILabel!

    @IBOutlet weak var newsAuthorNameLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(viewModel:NewsTableCellModel,tableView:UITableView){
        self.newsTbaleViewCellImage.layer.cornerRadius = 25.0
        self.newsTableViewcellHeadline.text = viewModel.title
        self.newsTbaleViewCellImage.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""))
        self.newsAuthorNameLabel.text=viewModel.author
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: viewModel.date!)
        self.newsDateLabel.text = "\(date!)"
    }
    
}
