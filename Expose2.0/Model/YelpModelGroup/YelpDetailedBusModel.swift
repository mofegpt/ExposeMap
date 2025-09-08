//
//  YelpDetailedBusModel.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 10/7/22.
//

import Foundation

struct YelpBusinessDetail: Codable {
    let id, alias, name: String
    let imageURL: String?
    // let isClaimed, isClosed: Bool
    let url: String?
    let phone, displayPhone: String?
    //let reviewCount: Int?
    // let categories: [Category]
    let rating: Double?
    let location: Location?
    let coordinates: Coordinates?
    let photos: [String]?
    // let hours: [Hour]
    // let transactions: [String]
    //let specialHours: [SpecialHour]

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        //case isClaimed = "is_claimed"
        //case isClosed = "is_closed"
        case url, phone
        case displayPhone = "display_phone"
        //case reviewCount = "review_count"
        //case categories, location, coordinates, photos, hours, transactions
        //case coordinates, photos
        case rating, location, coordinates, photos
        //case specialHours = "special_hours"
    }
}

// MARK: - Hour
struct Hour: Codable {
    let hourOpen: [Open]
    let hoursType: String
    let isOpenNow: Bool

    enum CodingKeys: String, CodingKey {
        case hourOpen = "open"
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
}

// MARK: - Open
struct Open: Codable {
    let isOvernight: Bool
    let start, end: String
    let day: Int

    enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start, end, day
    }
}

// MARK: - SpecialHour
struct SpecialHour: Codable {
    let date: String
    let isClosed, isOvernight: Bool?
    let start, end: String?

    enum CodingKeys: String, CodingKey {
        case date
        case isClosed = "is_closed"
        case start, end
        case isOvernight = "is_overnight"
    }
}
