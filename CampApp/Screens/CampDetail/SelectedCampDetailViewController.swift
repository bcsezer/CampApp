//
//  SelectedCampDetailViewController.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SelectedCampDetailDisplayLogic: AnyObject {
    func display(viewModel: SelectedCampDetail.Something.ViewModel)
}

class SelectedCampDetailViewController: UIViewController, SelectedCampDetailDisplayLogic {
    var interactor: SelectedCampDetailBusinessLogic?
    var router: (NSObjectProtocol & SelectedCampDetailRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = SelectedCampDetail.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    @IBAction func tapBack(_ sender: Any) {
        router?.routeToBack()
    }
    
    func display(viewModel: SelectedCampDetail.Something.ViewModel) {
    
    }
}
