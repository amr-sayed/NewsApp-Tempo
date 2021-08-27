//
//  News.swift
//  NewsApp
//
//  Created by Amr Ahmed on 12/08/2021.
//

import Foundation

struct News: Codable,Equatable {

    var source : Source?
    var author : String?
    var title : String?
    var description : String?
    var content : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    
    static func == (lhs: News, rhs: News) -> Bool {
       return lhs.title == rhs.title
    }
}
