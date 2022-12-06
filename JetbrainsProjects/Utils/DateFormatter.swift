//
//  DateFormatter.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation
extension String {
  
  func toDateString(from:String, to:String, locale:String = "en_US_POSIX") -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = from
    dateFormatter.locale = Locale(identifier: locale)
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    if let date = dateFormatter.date(from: self){
      dateFormatter.timeZone = TimeZone.current
      dateFormatter.dateFormat = to
      let dateString = dateFormatter.string(from: date)
      return dateString
    }else{
      return ""
    }
  }
}
