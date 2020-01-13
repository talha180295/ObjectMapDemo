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
   
    
    static let AccessToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZWVyLXBhcmtpbmcuYXBwcy5mb21hcmttZWRpYS5jb21cL2FwaVwvdjFcL3JlZnJlc2giLCJpYXQiOjE1Nzg5MDI2MjQsImV4cCI6MTU4MDEyNDU3NCwibmJmIjoxNTc4OTE0OTc0LCJqdGkiOiIzemMwd2tkdnRxUEZWaU9IIiwic3ViIjoxMSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.L4JXbU88wwjZOOTym_lsO9a_auu5YLZf7oafP1ZXyOY"
    
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
    static let nullInt:Int = 045
    static let nullString = "-"
    static let nullDouble = Double("-")
}
