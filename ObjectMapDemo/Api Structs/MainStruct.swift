//
//  MainStruct.swift
//  ObjectMapDemo
//
//  Created by Apple on 13/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation

struct ResponseDataArray <T:Codable> : Codable {
    var success:Bool
    var data:[T]?
    var message:String
}


struct ResponseData <T:Codable> : Codable {
    var success:Bool
    var data:T?
    var message:String
}
