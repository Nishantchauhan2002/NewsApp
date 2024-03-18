//
//  bannerViewModel.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 12/03/24.
//

import Foundation


class BannerViewModel{
    
    
    var isLoading:Observable<Bool> = Observable(false)
    var dataSource:NewsCellModel?
    
    var bannerDataSource:Observable<[BannerModel]>=Observable(nil)
    
    func getBannerData(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        
        APICaller.getHeadlines {[weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Banner Data is here \(data.articles?.count)")
                self?.dataSource=data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    func mapCellData(){
        print("map cell data here")
        self.bannerDataSource.value = self.dataSource?.articles!.compactMap({ BannerModel(news:$0 )})
        print(bannerDataSource.value)
    }
    
}
