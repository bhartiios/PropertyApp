//
//  Property.swift
//  PropertyApp
//
//  Created by Bharti Sharma on 08/01/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import Foundation

struct Property {
    
    var propertyID = 0
    var title =  ""
    var location = ""
    var address1 = ""
    var address2 = ""
    var suburb = ""
    var postcode = ""
    var isPremium = false
    var bedrooms = 0
    var bathrooms = 0
    var carspots = 0
    var description = ""
    var price = 0.0
    var ownerFirstName = ""
    var ownerLastName = ""
    var avatarUrl = ""
    
    //MARK:- Custom Methods
    
    mutating func fillData(dictProperty:[String:AnyObject]){
        
        if let idValue = dictProperty["id"] as? NSNumber{
            propertyID = idValue.intValue
        }
        if let name = dictProperty["title"] as? String{
            title = name
        }
        if let dictLoc = dictProperty["location"] as? [String:AnyObject]{
            
            if let name = dictLoc["address_1"] as? String{
                address1 = name
            }
            if let name = dictLoc["address_2"] as? String{
                address2 = name
            }
            if let name = dictLoc["suburb"] as? String{
                suburb = name
            }
            if let name = dictLoc["postcode"] as? String{
                postcode = name
            }
        }
        
        if let name = dictProperty["is_premium"] as? NSNumber{
            isPremium = name.boolValue
        }
        if let name = dictProperty["bedrooms"] as? NSNumber{
            bedrooms = name.intValue
        }
        if let name = dictProperty["bathrooms"] as? NSNumber{
            bathrooms = name.intValue
        }
        if let name = dictProperty["carspots"] as? NSNumber{
            carspots = name.intValue
        }
        if let name = dictProperty["description"] as? String{
            description = name
        }
        if let name = dictProperty["price"] as? NSNumber{
            price = Double(name.floatValue)
        }
        if let dictOwner = dictProperty["owner"] as? [String:AnyObject]{
            if let name = dictOwner["first_name"] as? String{
                ownerFirstName = name
            }
            if let name = dictOwner["last_name"] as? String{
                ownerLastName = name
            }
        }
        
        if let dictPhoto = dictProperty["photo"]?["image"] as?[String:AnyObject] , let url = dictPhoto["medium"]?["url"] as? String{
            avatarUrl = url
        }
    }
}
