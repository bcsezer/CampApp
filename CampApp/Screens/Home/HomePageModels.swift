//
//  HomePageModels.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import UIKit

enum HomePage {
    
    // MARK: Use cases
    enum GetData {
        struct Request {
        }
        struct Response {
            let places: [PlaceEntity]
        }
        struct ViewModel {
            let places: [PlaceEntity]
        }
    }
}
