//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 11/03/24.
//

import Foundation
class MainViewModel{
    var isLoading:Observable<Bool>=Observable(false)
    var dataSource:NewsCellModel?
    
    var cellDataSource:Observable<[NewsTableCellModel]>=Observable(nil)
    
    func getData(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        
        APICaller.getTrendingNews {[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                print("News Data is here \(data.articles!.count)")
                self?.dataSource=data
                self?.mapCellData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
   
    func mapCellData(){
        print("map cell data here")
        self.cellDataSource.value = self.dataSource?.articles!.compactMap({ NewsTableCellModel(news:$0 )})
    }
    
    func numberOfSections() -> Int{
        1
    }
    func numberOfRows(in section:Int) -> Int{
        self.dataSource?.articles?.count ?? 0
    }
}
  
