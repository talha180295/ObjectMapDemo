// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bargainings = try? newJSONDecoder().decode(Bargainings.self, from: jsonData)

import Foundation
import Alamofire


// MARK: - Bargainings
struct Bargainings: Codable {
    let id, parkingID, buyerID, status: Int?
    let offer: Double?
    let direction: Int?
    let createdAt, updatedAt, deletedAt, statusText: String?
    let buyer: Buyer?
    let seller: Seller?
    let parking: Parkings?
    
    enum CodingKeys: String, CodingKey {
        case id
        case parkingID = "parking_id"
        case buyerID = "buyer_id"
        case status, offer, direction
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case statusText = "status_text"
        case buyer,parking 
        case seller
    }
}


// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseAPIRes(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<ResponseDataArray<Bargainings>>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
  
}
