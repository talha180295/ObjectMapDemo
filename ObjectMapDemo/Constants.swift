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
   
    
    static let AccessToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZWVyLXBhcmtpbmcuYXBwcy5mb21hcmttZWRpYS5jb21cL2FwaVwvdjFcL3JlZnJlc2giLCJpYXQiOjE1Nzk2MDY5NjYsImV4cCI6MTU4MDgxNjYxOCwibmJmIjoxNTc5NjA3MDE4LCJqdGkiOiI3M0JlUmJOVmhXRmQ5WjczIiwic3ViIjo1MCwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.37MilTx0BQKulsT7rBncb6KleoaRiaoxQv7CxGmSxRk"
    
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
