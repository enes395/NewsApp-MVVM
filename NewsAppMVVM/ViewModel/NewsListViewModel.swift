//
//  NewsListViewModel.swift
//  NewsAppMVVM
//
//  Created by Muhammed Enes Kılıçlı on 19.09.2022.
//

import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel]()
    
    let reuseId = "news"
    
    func getNews (comletion: @escaping ([NewsViewModel]) -> Void ) {
        
        NetworkManager.shared.getNews { news in
            guard let news = news else {
                return
            }
            
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                comletion(newsVM)
            }
            
        }
        
    }
}
