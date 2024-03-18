//
//  bannerModel.swift
//  NewsApp
//
//  Created by Ankit Yadav on 18/03/24.
//

import Foundation

class BannerModel{
    var bannerImage:String?
    var dataSource:BannerViewModel?
    var title:String?

    
    
    
    init(news:News){
        self.bannerImage=news.urlToImage
        self.title=news.title
    }
}
