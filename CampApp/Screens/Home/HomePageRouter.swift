//
//  HomePageRouter.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomePageRoutingLogic {
    func routeToDetail(selectedPlace: PlaceEntity)
}

class HomePageRouter: NSObject, HomePageRoutingLogic {
    weak var viewController: HomePageViewController?

    // MARK: Routing Logic
    
    func routeToDetail(selectedPlace: PlaceEntity) {
        let detailPage = ViewControllerFactory.sharedInstance.makeSelectedCampDetail(selectedPlace: selectedPlace)
        viewController?.navigationController?.pushViewController(detailPage, animated: true)
    }
}
