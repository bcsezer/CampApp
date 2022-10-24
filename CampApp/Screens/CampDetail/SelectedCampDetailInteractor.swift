//
//  SelectedCampDetailInteractor.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//

import UIKit

protocol SelectedCampDetailBusinessLogic {
    func handle(request: SelectedCampDetail.CampDetail.Request)
}

class SelectedCampDetailInteractor: SelectedCampDetailBusinessLogic {
    var presenter: SelectedCampDetailPresentationLogic?
    var selectedPlace: PlaceEntity?
    
    // MARK: Business Logic

    func handle(request: SelectedCampDetail.CampDetail.Request) {
        guard let selectedPlace = selectedPlace else {
            presenter?.present(response: SelectedCampDetail.Error.Response())
            return
        }
        presenter?.present(response: SelectedCampDetail.CampDetail.Response(place: selectedPlace))
    }
}
