//
//  Constants.swift
//  ObjectMapDemo
//
//  Created by Apple on 09/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//
import Foundation

struct K {
    struct ProductionServer {
//        static let baseURL = "http://itechnodev.com/api"
//        static let baseURL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede"
   
        static let baseURL = "http://peer-parking.apps.fomarkmedia.com/api/v1"
    }
   
    
    static let AccessToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZWVyLXBhcmtpbmcuYXBwcy5mb21hcmttZWRpYS5jb21cL2FwaVwvdjFcL3JlZnJlc2giLCJpYXQiOjE1Nzk4NzE0NjUsImV4cCI6MTU4MTA4NTMxMCwibmJmIjoxNTc5ODc1NzEwLCJqdGkiOiJUU2NwUEt6U2YxUWNRSmxXIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.AclvO3gsFGFfsZfI8yCoLOfSTAojqetze92lwLmXMDo"
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}


struct Nulls {
    static let nullInt:Int = 0
    static let nullString = "-"
    static let nullDouble:Double = 0.0
}
