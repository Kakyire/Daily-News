//
//  NetworkRequests.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import Foundation
import Alamofire

class NetworkRequests{
    
    func getTopHeadlines(complete:@escaping (DataResponse<NewsModel,AFError>)->Void)  {
        print("We are here")
        NetworkHelper.get(endPoint: "top-headlines", of: NewsModel.self, complete:complete)
        
        
    }
}
