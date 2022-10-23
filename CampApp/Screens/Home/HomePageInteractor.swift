//
//  HomePageInteractor.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import UIKit

protocol HomePageBusinessLogic {
    func handle(request: HomePage.GetData.Request)
}

class HomePageInteractor: HomePageBusinessLogic {
    var presenter: HomePagePresentationLogic?
    var fetcher = GetPlacesFetcher.shared
    
    // MARK: Business Logic

    func handle(request: HomePage.GetData.Request) {
        
        let data = fetcher.getPlaces() ?? []
        
        let response = HomePage.GetData.Response(places: data)
        presenter?.present(response: response)
    }
}
