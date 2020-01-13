// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let details = try? newJSONDecoder().decode(Details.self, from: jsonData)

import Foundation

// MARK: - Details
struct Details: Codable {
    let id: Int?
    let firstName, lastName: String?
    let averageRating: Double?
    let phone: String?
    let address: String?
    let image: String?
    let isVerified, emailUpdates, isSocialLogin: Int?
    let wallet: Double?
    let imageURL: String?
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case averageRating
        case phone, address, image
        case isVerified
        case emailUpdates
        case isSocialLogin
        case wallet
        case imageURL
        case fullName
    }
}
