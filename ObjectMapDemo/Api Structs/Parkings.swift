//
//  Parkings.swift
//  ObjectMapDemo
//
//  Created by Apple on 13/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parkings = try? newJSONDecoder().decode(Parkings.self, from: jsonData)

import Foundation

// MARK: - Parkings
struct Parkings: Codable {
    let id, sellerID, buyerID, vehicleType: Int?
    let parkingType, status, initialPrice, finalPrice: Int?
    let isNegotiable: Bool?
    let startAt, endAt, address, latitude: String?
    let longitude, image, note: String?
    let parkingHoursLimit: Int?
    let parkingAllowedUntil: String?
    let parkingExtraFee, parkingExtraFeeUnit: Int?
    let isResidentFree: Bool?
    let createdAt, updatedAt, deletedAt: String?
    let action: Int?
    let extraFeeUnitText, vehicleTypeText: String?
    let imageURL: String?
    let parkingTypeText: String?
    let seller, buyer: Buyer?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sellerID
        case buyerID
        case vehicleType
        case parkingType
        case status
        case initialPrice
        case finalPrice
        case isNegotiable
        case startAt
        case endAt
        case address, latitude, longitude, image, note
        case parkingHoursLimit
        case parkingAllowedUntil
        case parkingExtraFee
        case parkingExtraFeeUnit
        case isResidentFree
        case createdAt
        case updatedAt
        case deletedAt
        case action
        case extraFeeUnitText
        case vehicleTypeText
        case imageURL
        case parkingTypeText
        case seller, buyer
    }
}

