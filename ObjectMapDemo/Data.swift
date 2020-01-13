//
//  Data.swift
//  ObjectMapDemo
//
//  Created by Apple on 08/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation

struct ApiResponseMultipleData <T:Codable> : Codable {
    var success:Bool
    var data:[T]?
    var message:String
}

struct ParkingsById<T:Codable>: Codable {
    var success:Bool
    var data:T
    var message:String
   
}

struct ParkingData:Codable {
    var id:Int
    var initialPrice:Double
    var address:String?
    var note:String?
    enum CodingKeys: String,CodingKey {
        case id
        case address
        case note
        case initialPrice = "initial_price"
    }
}

struct BargainingData:Codable {
    var id:Int
    var parking_id:Int
    var offer:Double
    var direction:Int
    var statusText:String
    enum CodingKeys: String,CodingKey {
        case id
        case parking_id = "parking_id"
        case offer
        case direction
        case statusText = "status_text"
    }
}
