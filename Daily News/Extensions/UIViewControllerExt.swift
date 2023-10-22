//
//  ViewControllerExt.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import Foundation
import Alamofire
import UIKit

extension UIViewController{
    
    func handle<T>(response:DataResponse<T,AFError>,onSuccess: @escaping (T)->Void){
        switch (response.result){
        case .success(let data):
            onSuccess(data)
            break
        case .failure(let error):
            let message:String
            let errorMessage = error.localizedDescription
            
            if errorMessage.contains("Internet") || errorMessage.contains("server") {
                message =  "No Internet connection"
            }else{
                message =  errorMessage
            }
            
            let alert = UIAlertController( title: nil, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            break
            
            
        }
    }
}
