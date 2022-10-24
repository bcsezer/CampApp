//
//  SelectedCampDetailPresenter.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SelectedCampDetailPresentationLogic {
    func present(response: SelectedCampDetail.CampDetail.Response)
    func present(response: SelectedCampDetail.Error.Response)
}

class SelectedCampDetailPresenter: SelectedCampDetailPresentationLogic {
    weak var viewController: SelectedCampDetailDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: SelectedCampDetail.CampDetail.Response) {
        let viewModel = SelectedCampDetail.CampDetail.ViewModel(place: response.place)
        viewController?.display(viewModel: viewModel)
    }
    
    func present(response: SelectedCampDetail.Error.Response) {
        viewController?.display(viewModel: SelectedCampDetail.Error.ViewModel())
    }
}
