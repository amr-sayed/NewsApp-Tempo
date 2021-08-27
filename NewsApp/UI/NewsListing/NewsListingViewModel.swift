//
//  NewsListingViewModel.swift
//  NewsApp
//
//  Created by Amr Ahmed on 25/08/2021.
//

import Foundation
import Combine

class NewsListingViewModel: ObservableObject {
    
    @Published var newList = [News]()
    @Published var searchText = "Apple"
    @Published var isLoading = false
    
    var pageNumber = 1
    let dataSource = NewsDataSource()
    var response = NewsResponse()
    var subscribtion = Set<AnyCancellable>()
    
    init() {
        loadLatestNews()
    }
    
    func loadLatestNews(){
        $searchText
            .debounce(for: .milliseconds(500) , scheduler: RunLoop.main)
            .map {[unowned self] text -> AnyPublisher<NewsResponse,Never> in
                if text.count > 2 {
                    self.isLoading = true
                    return self.dataSource.loadRecentNews(query: text,page: pageNumber)
                        .catch { _ in
                            Just(NewsResponse())
                        }.eraseToAnyPublisher()
                }else{
                    return Just(NewsResponse()).eraseToAnyPublisher()
                }
            }
            .switchToLatest()
            .sink(receiveValue: { response in
                self.newList = response.articles
                self.response = response
                self.isLoading = false
            })
            .store(in: &subscribtion)
        
        // Clear pageNumber while writing
        $searchText.sink { _ in
            self.pageNumber = 1
        }.store(in: &subscribtion)
    }
    
    func isLastItem(news : News) -> Bool {
        let listSize =  newList.count
        return news == newList[listSize - 1]
    }
    
    func loadMoreNews()  {
        isLoading = true
        self.pageNumber = self.pageNumber + 1
        self.dataSource.loadRecentNews(query: searchText,page: pageNumber)
            .sink { _ in } receiveValue: { response in
                self.newList.append(contentsOf: response.articles)
                self.response = response
                self.isLoading = false
            }.store(in: &subscribtion)
    }
    
}
