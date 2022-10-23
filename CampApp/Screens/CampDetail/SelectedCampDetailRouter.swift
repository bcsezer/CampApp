//
//  SelectedCampDetailRouter.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SelectedCampDetailRoutingLogic {
    func routeToBack()
}

class SelectedCampDetailRouter: NSObject, SelectedCampDetailRoutingLogic {
    weak var viewController: SelectedCampDetailViewController?

    // MARK: Routing Logic
    
    func routeToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
