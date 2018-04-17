//
//  PersonDetails.swift
//  FetchJson
//
//  Created by Devi on 17/04/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import ObjectMapper

class PersonDetails: Mappable {
    
    var name : String?
    var age: Int?
    var dob: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name  <- map["name"]
        age <- map["age"]
        dob <- map["dob"]
    }
}
