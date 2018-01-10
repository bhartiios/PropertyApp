//
//  WebserviceCall.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 30/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiManager {
    
}

extension ApiManager{
    
    
    /// Get Webservice
    ///
    /// - Parameters:
    ///   - strURL: url string
    ///   - completionHandler: Completion closure
    
    func makeGETWebserviceCall(strURL:String, completionHandler: @escaping (_ jsonResponse:Any?) -> Void, failureHandler: @escaping (_ error: Error?) -> Void){
     
        Alamofire.request(strURL).responseJSON { response in
            
            if response.result.isSuccess{
                guard let jsonResponse = response.result.value else{
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data in string format: \(utf8Text)") // original server data as UTF8 string
                    }
                    failureHandler(response.result.error)
                    return
                }
                completionHandler(jsonResponse)
            } else{
                failureHandler(response.result.error)
            }
        }
    }
}
