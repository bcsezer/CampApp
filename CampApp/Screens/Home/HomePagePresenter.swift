//
//  HomePagePresenter.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomePagePresentationLogic {
    func present(response: HomePage.GetData.Response)
}

class HomePagePresenter: HomePagePresentationLogic {
    weak var viewController: HomePageDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: HomePage.GetData.Response) {
        let viewModel = HomePage.GetData.ViewModel(places: response.places)
        viewController?.display(viewModel: viewModel)
    }
}
