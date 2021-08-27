//
//  DateUtils.swift
//  NewsApp
//
//  Created by Amr Ahmed on 27/08/2021.
//

import Foundation

class DateUtils {
    

    static func getCurrentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
      return formatter.string(from: date)
    }
}
