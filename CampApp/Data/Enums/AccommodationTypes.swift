//
//  AccommodationTypes.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.

import UIKit

enum AccommodationTypes: String {
    case none
    case vehicle = "VEHICLE"
    case caravan = "CARAVAN"
    case tent = "TENT"
    
    func icon() -> UIImage? {
        switch self {
        case .none:
            return UIImage()
        case .vehicle:
            return Images.vehicle
        case .caravan:
            return Images.caravan
        case .tent:
            return Images.tent_icon
        }
    }
    
    static func from(_ value: String?) -> AccommodationTypes {
        guard let value = value else { return .none }
        return AccommodationTypes(rawValue: value) ?? .none
    }
}
