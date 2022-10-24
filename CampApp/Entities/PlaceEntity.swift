//
//  PlaceEntity.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import Foundation

struct PlaceEntity {
    let title: String
    let images: [String]
    let city: String
    let country: String
    let latitute: Double
    let longitute: Double
    let fromPrice: Int
    let toPrice: Int
    let currency: String
    let hasElectricity: Bool
    let petsAllowed: Bool
    let accommodationTypes: [String]
    let lastModifiedDate: String
    let description: String
    let formattedAddress: String
    let streetAddress: String
    let coverImage: String
    let deepLink: String
}
