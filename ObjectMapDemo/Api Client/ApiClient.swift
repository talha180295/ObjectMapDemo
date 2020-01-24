//
//  ApiClient.swift
//  ObjectMapDemo
//
//  Created by Apple on 09/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    static func getDataRequest(url:URLRequestConvertible,completion:@escaping (DataResponse<Any>)->Void) {
        
        print("url==\(String(describing: try? url.asURLRequest()))")
        Alamofire.request(url).responseJSON { (response) in
            
            completion(response)
            
            
        }

    }
    
    
    static func getData<T:Decodable>(url:URLRequestConvertible,dec:T.Type,completion:@escaping (T? ,Error?)->Void) {
        
        print("url==\(String(describing: try? url.asURLRequest()))")
        
        
        Alamofire.request(url).responseJSON { (response) in
            
            
            if response.result.isSuccess {
                
                if let jsonData = response.data{
                    let response = try! JSONDecoder().decode(dec.self, from: jsonData)
                    
                    
                    completion(response, nil)
                }

            }
            else{
                
                completion(nil,response.error!)
            }
            
//            if response.result == nil{
//
//            }
//
            
            
        }
    }
    
//    static func getData(completion:@escaping ()->Void){
//        
//        Alamofire.request(APIRouter.bargainings([:])).responseAPIRes { response in
//            
//            if let aPIRes = response.result.value {
//                print("aPIRes=\(aPIRes)")
//            }
//        }
//        
//    }
}
