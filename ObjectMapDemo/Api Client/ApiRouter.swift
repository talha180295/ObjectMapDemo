//
//  ApiRouter.swift
//  ObjectMapDemo
//
//  Created by Apple on 09/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
  
    case parkingsWithoutToken([String:Any])
    case parkings([String:Any])
    case parkingsById(id:Int)
    case bargainings([String:Any])
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        
        case .parkingsWithoutToken,.parkings,.parkingsById,.bargainings:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
       
        case .parkingsWithoutToken:
            return "/parkings-without-token"

        case .parkings(_):
            return "/parkings"
        case .parkingsById(let id):
            return "/parkings/\(id)"
        case .bargainings(_):
            return "/bargainings"
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
       
        case .parkingsWithoutToken(let params):
            return (params)
            
        case .parkings(let params):
            return (params)
        case .parkingsById:
            return nil
        case .bargainings(let params):
            return (params)
        }
    }
    

    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(K.AccessToken, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
//        urlRequest.allHTTPHeaderFields = ["Authorization" : K.AccessToken]
        


        let encoding = URLEncoding(destination: .queryString)
        return try encoding.encode(urlRequest, with: parameters)
//        return urlRequest
    }
}
