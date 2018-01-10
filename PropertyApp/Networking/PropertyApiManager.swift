//
//  StatsApiManager.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

protocol PropertyApiManager: ApiManager {}

extension PropertyApiManager{
    
    //MARK:- Webservices
    
    /// Webservice to fetch Property details
    ///
    /// - Parameters:
    ///   - completionHandler: block to handle success
    ///   - failureHandler: block to handle failure
    func getPropertyList(completionHandler: @escaping (_ arrMatch:[Property]) -> Void, failureHandler: @escaping (_ error: Error?) -> Void){
        self.makeGETWebserviceCall(strURL: AppConstants.statsUrl, completionHandler: { (response) in
            guard let dictResponse = response as? [String:AnyObject], let arrResult = dictResponse["data"] as? [[String:AnyObject]] else{
                failureHandler(nil)
                return
            }
            
            var arrProperty = [Property]()
            for dictProp in arrResult{
                var property = Property()
                property.fillData(dictProperty: dictProp)
                arrProperty.append(property)
            }
            completionHandler(arrProperty)
        }) { (error) in
            failureHandler(error)
        }
    }
}
