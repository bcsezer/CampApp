//
//  SelectedCampDetailModels.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SelectedCampDetail {
    
    // MARK: Use cases
    enum CampDetail {
        struct Request {
        }
        struct Response {
            let place: PlaceEntity
        }
        struct ViewModel {
            let place: PlaceEntity
        }
    }
    
    enum Error {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
}
