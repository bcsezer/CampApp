//
//  PlaceModel.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import Foundation

struct Places: Codable {
    let places: [Place]
}

struct Place: Codable {
    let id: String?
    let isActive: Bool?
    let lastModifiedDate, title: String?
    let deepLink: String?
    let placeDescription, formattedAddress, streetAddress, zipCode: String?
    let city: String?
    let country: String?
    let openFromDate, openToDate: String?
    let totalPitches: Int?
    let hasElectricity, petsAllowed: Bool?
    let location: Location?
    let fromPrice, toPrice: Int?
    let currency: String?
    let coverImage: String?
    let images: [Image]?
    let amenities: [Amenity]?
    let accommodationTypes: [String]?
    let surfaceTypes: [String]?
}

struct Amenity: Codable {
    let id, type, value: String?
    let category: String?
    let core: Bool?
}

struct Image: Codable {
    let id: String?
    let imageURL: String?
    let order: Int?
}

struct Location: Codable {
    let lat, lng: Double?
}
