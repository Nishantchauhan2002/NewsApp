//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 11/03/24.
//

import Foundation

class DetailViewModel{
    
    var newsimage:String?
    var title:String?
    var description:String?
    var date:String?
    var author:String?
    
    init(news:News){
        self.title = news.title
        self.description = news.description
        self.date=news.publishedAt
        self.author = news.author
        self.newsimage=news.urlToImage

    }
}
