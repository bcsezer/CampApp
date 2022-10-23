//
//  ViewControllerFactory.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeHomeViewController() -> UIViewController
    func makeSelectedCampDetail(selectedPlace: PlaceEntity) -> UIViewController
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static let sharedInstance = ViewControllerFactory()
    
    func makeHomeViewController() -> UIViewController {
        let viewController = HomePageViewController(nibName: "HomePageView", bundle: nil)
        let interactor = HomePageInteractor()
        let presenter = HomePagePresenter()
        let router = HomePageRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    func makeSelectedCampDetail(selectedPlace: PlaceEntity) -> UIViewController {
        let viewController = SelectedCampDetailViewController(nibName: "SelectedCampDetailView", bundle: nil)
        let interactor = SelectedCampDetailInteractor()
        let presenter = SelectedCampDetailPresenter()
        let router = SelectedCampDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.selectedPlace = selectedPlace
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
