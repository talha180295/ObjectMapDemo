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
   
    
    static let AccessToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZWVyLXBhcmtpbmcuYXBwcy5mb21hcmttZWRpYS5jb21cL2FwaVwvdjFcL3JlZnJlc2giLCJpYXQiOjE1Nzg2NDA2NTIsImV4cCI6MTU3OTg1NDA3NCwibmJmIjoxNTc4NjQ0NDc0LCJqdGkiOiJGeW14cW43TGZNNGVhSVZsIiwic3ViIjoxMSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Ioa2gcfOZg4HTjezFZZxkc6gZ5qG0usV7Ysmm6MHrIY"
    
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
