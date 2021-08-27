//
//  NewsDataSource.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import Foundation
import Combine

class NewsDataSource : BaseDataSource  {
    
    
    func loadRecentNews(query : String,page : Int) -> AnyPublisher<NewsResponse,Error> {
        
        let agent = Agent()
        let params = ["q" : query,
                      "from" : DateUtils.getCurrentDate(),
                      "sortBy" : "publishedAt",
                      "page" : page,
                      "pageSize" : 20,
                      "apiKey" : Constants.API_KEY] as [String : Any]
        
        let url = baseURL + queryString(urlString: "everything" , params : params)
        return agent.run(URLRequest(url: URL(string: url)!))
                    .map(\.value)
                    .eraseToAnyPublisher()
    }
}

struct Agent {
    // 1
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    // 2
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}
