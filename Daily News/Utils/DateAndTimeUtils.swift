//
//  DateAndTimeUtils.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import Foundation

struct DateAndTimeUtils{
    
    private static var dateFormatter = DateFormatter()
//    "2023-10-17T13:38:00Z"
    static func formatDate( from input:String, to:String = "MMM dd, yyyy") -> String{
        var  dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from:input)
        
        dateFormatter.dateFormat = to
        
        let output :String
        if date != nil {
            output = dateFormatter.string(from: date!)
        }else{
            output = input
        }
        return output
    }
}
