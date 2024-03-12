//
//  bannerViewModel.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 12/03/24.
//

import Foundation


class BannerViewModel{
    var bannerImage:String?
    var dataSource:NewsCellModel?
    
    
    
    init(news:News){
        self.bannerImage=news.urlToImage
    }
}
