//
//  News.swift
//  NewsAppMVVM
//
//  Created by Muhammed Enes Kılıçlı on 17.09.2022.
//

import Foundation

struct News : Decodable {
    
    let author : String?
    let title : String?
    let description : String?
    let urlToImage : String?
    let url : String?
    
}

struct NewsEnvelope : Decodable {
    let status : String
    let totalResults : Int
    let articles : [News]
}
