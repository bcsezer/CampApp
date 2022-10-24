//
//  HomePageViewController.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import UIKit
import MapKit

protocol HomePageDisplayLogic: AnyObject {
    func display(viewModel: HomePage.GetData.ViewModel)
}

class HomePageViewController: UIViewController, HomePageDisplayLogic {
    var interactor: HomePageBusinessLogic?
    var router: (NSObjectProtocol & HomePageRoutingLogic)?
    
    private let cardView = CardView()
    
    @IBOutlet weak var mapKit: MKMapView!
    
    private struct Constants {
        static let viewHeight: CGFloat = 120.0
        static let bottomConstant: CGFloat = -50.0
        static let LeftRightConstant: CGFloat = 25.0
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        mapKit.delegate = self
        let request = HomePage.GetData.Request()
        interactor?.handle(request: request)
        
        view.addSubview(cardView)
        cardView.hide()
        autoLayouts()
        cardView.delegate = self
    }

    // MARK: Requests

    func display(viewModel: HomePage.GetData.ViewModel) {
        for location in viewModel.places {
            let anno = CustomAnnotation()
            anno.place = location
            anno.title = location.title
            
            let loc = CLLocationCoordinate2D(
                latitude: location.longitute,
                longitude: location.latitute
            )
            
            anno.coordinate = loc
            mapKit.addAnnotation(anno)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.mapKit.showAnnotations(self.mapKit.annotations, animated: true)
        })
    }
    
    private func autoLayouts() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomConstant).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.LeftRightConstant).isActive = true
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.LeftRightConstant).isActive = true
    }
}

extension HomePageViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else  {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = Images.tent
        annotationView?.image = pinImage
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
         view.image = Images.selectedTent
        cardView.show()
        if let annotation = view.annotation as? CustomAnnotation {
            guard let selectedPlace = annotation.place else { return }
            cardView.updateView(data: selectedPlace)
        }
    }
}

extension HomePageViewController: CardViewDelegate {
    func didPressView(data: PlaceEntity) {
        cardView.hide()
        router?.routeToDetail(selectedPlace: data)
    }
}
