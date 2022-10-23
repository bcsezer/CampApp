//
//  SelectedCampDetailInteractor.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SelectedCampDetailBusinessLogic {
    func handle(request: SelectedCampDetail.Something.Request)
}

class SelectedCampDetailInteractor: SelectedCampDetailBusinessLogic {
    var presenter: SelectedCampDetailPresentationLogic?
    var selectedPlace: PlaceEntity?
    
    // MARK: Business Logic

    func handle(request: SelectedCampDetail.Something.Request) {
        let response = SelectedCampDetail.Something.Response()
        presenter?.present(response: response)
    }
}
