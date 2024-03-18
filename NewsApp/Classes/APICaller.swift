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
    
    static func getTrendingNews(param:String,
        completionHandler:@escaping (_ result:Result<NewsCellModel,NetworkError>) -> Void){
        
//            var urlString = "https://newsapi.org/v2/everything?from=2024-02-11&sortBy=publishedAt&apiKey=000b455629614e679b6a11752b8aa06f&language=en"
            
        var urlString="https://newsapi.org/v2/everything?apiKey=000b455629614e679b6a11752b8aa06f&language=en&q=india"
        if !param.isEmpty{
            urlString.append("&q=\(param)")
        }
            guard var url=URL(string: urlString) else{
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
    
    static func getHeadlines(completionHandler:@escaping(_ result:Result<NewsCellModel,NetworkError>) -> Void){
        var urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=000b455629614e679b6a11752b8aa06f"
//        var urlString="https://newsapi.org/v2/everything?apiKey=000b455629614e679b6a11752b8aa06f&language=en&q=india"

        guard let url = URL(string: urlString) else{
            return completionHandler(.failure(.urlError))
        }
        
        URLSession.shared.dataTask(with: url) { (dataResponse,URLResponse,error) in
            print(dataResponse)
            
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(NewsCellModel.self
                                                          , from: data){
                completionHandler(.success(resultData))

            }else{
                completionHandler(.failure(.canNotParseData))
            }
        }
        .resume()
    }
    
}

