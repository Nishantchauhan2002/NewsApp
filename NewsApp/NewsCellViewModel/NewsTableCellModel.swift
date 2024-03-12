//
//  NewsCellModel.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 11/03/24.
//

import Foundation

class NewsTableCellModel{
    var title:String?
    var description:String?
    var imageUrl:String?
    var author:String?
    var date:String?
    
    
    
    
    init(news:News){
        self.title = news.title
        self.description = news.description
        self.imageUrl = news.urlToImage
        self.author=news.author
        self.date=news.publishedAt
    }
    
}
