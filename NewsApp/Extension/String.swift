//
//  String.swift
//  NewsApp
//
//  Created by Amr Ahmed on 26/08/2021.
//

import Foundation
extension String {
    
    func formateStringDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "EEEE"
        var dayName = dateFormatter.string(from: date ?? Date())
        let indexStartOfText = dayName.index(dayName.startIndex, offsetBy: 3)
        dayName =  String(dayName[..<indexStartOfText])
        dateFormatter.dateFormat = "dd"
        let dayNumber = dateFormatter.string(from: date ?? Date())
        dateFormatter.dateFormat = "LLLL"
        var monthName = dateFormatter.string(from: date ?? Date())
        monthName =  String(monthName[..<indexStartOfText])
        
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date ?? Date())
        
        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: date ?? Date())
        
        return   dayNumber + " " + monthName + " " + year + " " +   time
    }
    
    func trim() -> String
     {
      return self.trimmingCharacters(in: CharacterSet.whitespaces)
     }
    
    
}
