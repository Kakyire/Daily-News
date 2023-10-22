//
//  NetworkHelper.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import Alamofire
import Keys

struct NetworkHelper {
    
    
    private static let keys = DailyNewsKeys()
    
    
    static func get<T:Decodable>(endPoint:String,of:T.Type,parameters:[String:Any]? = nil,complete:@escaping (DataResponse<T,AFError>)->Void){
        var params: [String : Any] = parameters ?? [:]
        
        params.updateValue(keys.nEWS_API_KEY, forKey: "apiKey")
        params.updateValue("us", forKey: "country")
        
        AF.request(K.baseUrl+endPoint,parameters: params)
            .validate()
            .responseDecodable(of:T.self,completionHandler: complete)
    }
    
    static func get<T:Decodable,Param:Encodable>(endPoint:String,of:T.Type,parameters:Param? = nil,complete:@escaping (DataResponse<T,AFError>)->Void){
        
        let apiKey = "?apiKey=\(keys.nEWS_API_KEY)"
        AF.request(K.baseUrl+endPoint,parameters: parameters)
            .validate()
            .responseDecodable(of:T.self,completionHandler: complete)
    }
}

