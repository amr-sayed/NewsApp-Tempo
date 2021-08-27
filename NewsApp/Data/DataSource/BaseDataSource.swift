//
//  BaseDataSource.swift
//  TandaRevamp
//
//  Created by Amr Ahmed on 18/01/2021.
//

import Foundation

class BaseDataSource {
    
    
    let baseURL = "https://newsapi.org/v2/"
    
    
    func queryString(urlString:String, params:[String: Any]) -> String {
        if params.count == 0 {
            return urlString
        }
        let queryItems = params.map({ URLQueryItem(name: $0.key, value: String(describing: $0.value)) })
        
        var urlComps = URLComponents(string: urlString)
        urlComps?.queryItems = queryItems
        
        return urlComps?.url?.absoluteString ?? ""
    }
    
    public enum ResponseStatus: String {
        case error = "error"
        case sucess = "success"
        case networkError = "networkError"
    }
}
