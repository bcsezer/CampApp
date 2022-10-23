//
//  SelectedCampDetailPresenter.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SelectedCampDetailPresentationLogic {
    func present(response: SelectedCampDetail.Something.Response)
}

class SelectedCampDetailPresenter: SelectedCampDetailPresentationLogic {
    weak var viewController: SelectedCampDetailDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: SelectedCampDetail.Something.Response) {
        let viewModel = SelectedCampDetail.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
