//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 11/03/24.
//

import UIKit
import SDWebImage
import WebKit

class NewsDetailViewController: UIViewController {
    var webView: WKWebView!

    var viewModel:NewsTableCellModel
    
    init(viewModel: NewsTableCellModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "NewsDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var detailedImage: UIImageView!
    @IBOutlet weak var detailDescription: UILabel!
    
    @IBOutlet weak var newsAuthorName: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()

    }
     func configView(){
         
         self.detailedImage.layer.cornerRadius = 10.0
         
//        self.title="News"
        
         self.newsTitle.text = viewModel.title
         self.detailedImage.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""))
         self.detailDescription.text=viewModel.description
         self.newsAuthorName.text = viewModel.author
    }
}
