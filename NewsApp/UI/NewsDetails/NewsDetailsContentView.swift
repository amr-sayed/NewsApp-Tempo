//
//  NewsDetailsContentView.swift
//  NewsApp
//
//  Created by Amr Ahmed on 25/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailsContentView: View {
    
    var news  = News()
    var body: some View {
        ScrollView{
            VStack{
                // Image
                WebImage(url:  URL(string: news.urlToImage ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        
                // Title
                Text(news.title ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                    .font(.headline)
                
                HStack{
                    // Author
                    Text(news.author ?? "")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,   alignment: .leading)
                        .foregroundColor(Colors.blueColor)
                    // Source
                    HStack{
                        Text(news.source?.name ?? "")
                            .padding(.vertical, 7)
                            .padding(.horizontal)
                            .background(Colors.darkBlueColor)
                            .foregroundColor(.white)
                            .font(.caption)
                            .cornerRadius(5)
                    }
                }.padding(.horizontal,10)
                // Description
                Text(news.description ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                    .foregroundColor(Colors.black50)
                
                // content
                Text(news.content ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                    .foregroundColor(Colors.black50)
                
                // Date
                Text(news.publishedAt?.formateStringDate() ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                
                // Navigate to source
                HStack {
                    Button("Visit Source Website"){
                       UIApplication.shared.open(URL(string: news.url ?? "")!)
                    }
                    .padding(.vertical,15)
                    .padding(.horizontal,70)
                    .background(Colors.blueColor)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                }.padding(.top,50)
                .navigationTitle("News")
            }
        }
    }
}

struct NewsDetailsContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsContentView()
    }
}
