// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let card = try? newJSONDecoder().decode(Card.self, from: jsonData)

import Foundation

// MARK: - Card
struct Card: Codable {
    let id, userID: Int?
    let stripeCardID: String?
    let lastFour: Int?
    let brand, country: String?
    let expMonth, expYear: Int?
    let createdAt, updatedAt, deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID
        case stripeCardID
        case lastFour
        case brand, country
        case expMonth
        case expYear
        case createdAt
        case updatedAt
        case deletedAt
    }
}
