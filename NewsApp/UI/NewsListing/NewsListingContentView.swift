//
//  ContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 25/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsListingContentView: View {
    
    @StateObject  var viewModel = NewsListingViewModel()
    var lastNewItem =  News()
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack{
                    // Title
                    Text("News").font(Font.system(size:20, design: .default))
                        .fontWeight(.semibold)
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                    // Search View
                    HStack {
                        TextField("Search...", text: $viewModel.searchText).padding(.leading, 10)
                            .foregroundColor(.black)
                        Spacer()
                        Image("ic_search")
                            .padding()
                    }.border(Colors.greyColor, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                    .padding()
                    
                    LazyVStack {
                        // newsList
                        ForEach(0 ..< viewModel.newList.count,id: \.self) { index in
                            NavigationLink(destination: NewsDetailsContentView(news: viewModel.newList[index]) ) {
                                
                                NewsCell(news: viewModel.newList[index],viewModel: self.viewModel)
                            }
                        }
                    }
                    .listStyle(InsetListStyle())
                    
                    if viewModel.isLoading {
                        ProgressView()
                    }
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
            }
            .navigationBarTitle("",displayMode :.inline)
            .navigationBarHidden(true)
        }
    }
}

struct NewsCell : View{
    var news = News()
    var viewModel  = NewsListingViewModel()
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white).shadow(radius: 2)
                .padding(.horizontal,12)
                .padding(.vertical,10)
            
            VStack{
                WebImage(url: URL(string: news.urlToImage ?? ""))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(news.description ?? "")
                    .lineLimit(2)
                    .padding(.horizontal,10)
                    .foregroundColor(.black)
                
                HStack{
                    Text(news.source?.name ?? "").padding(.vertical, 7).padding(.horizontal)
                        .background(Colors.darkBlueColor)
                        .foregroundColor(.white)
                        .font(.caption)
                        .cornerRadius(5)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                    
                }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.bottom,8)
                
                if viewModel.isLastItem(news: news) {
                    Text("")
                        .onAppear(perform: {
                            viewModel.loadMoreNews()
                        })
                }
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding(.horizontal,12)
            .padding(.vertical,5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListingContentView()
    }
}
