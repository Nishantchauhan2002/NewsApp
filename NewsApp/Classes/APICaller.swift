//
//  APICaller.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 11/03/24.
//

import Foundation

enum NetworkError:Error{
    case urlError
    case canNotParseData
}

class APICaller{
    
    static func getTrendingNews(
        completionHandler:@escaping (_ result:Result<NewsCellModel,NetworkError>) -> Void){
        
            let urlString = "https://newsapi.org/v2/everything?q=india&from=2024-02-11&sortBy=publishedAt&apiKey=000b455629614e679b6a11752b8aa06f&language=en"
            
            guard let url=URL(string: urlString) else{
                return completionHandler(.failure(.urlError))
            }
            URLSession.shared.dataTask(with: url) { (dataResponse, urlResponse, error) in
                print(dataResponse)
                if error == nil,
                    let data = dataResponse,
                        let resultData = try? JSONDecoder().decode(NewsCellModel.self
                                                                   , from: data){
                            completionHandler(.success(resultData))
                        }
                else{
                   
                    completionHandler(.failure(.canNotParseData))
                }
                
            }.resume()
    }
    
}
