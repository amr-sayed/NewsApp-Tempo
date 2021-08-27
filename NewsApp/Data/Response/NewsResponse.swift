//
//  ArticlesResponse.swift
//  NewsApp
//
//  Created by Amr Ahmed on 13/08/2021.
//

import Foundation

struct NewsResponse : Codable {
    
    var articles = [News]()
    var status : String?
    var totalResults = 0
}
