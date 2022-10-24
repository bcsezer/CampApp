//
//  SelectedCampDetailViewController.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import ImageSlideshow

protocol SelectedCampDetailDisplayLogic: AnyObject {
    func display(viewModel: SelectedCampDetail.CampDetail.ViewModel)
    func display(viewModel: SelectedCampDetail.Error.ViewModel)
}

class SelectedCampDetailViewController: UIViewController, SelectedCampDetailDisplayLogic {
    var interactor: SelectedCampDetailBusinessLogic?
    var router: (NSObjectProtocol & SelectedCampDetailRoutingLogic)?
    
    @IBOutlet private weak var shareView: UIView!
    @IBOutlet weak var imageSlider: ImageSlideshow!
    @IBOutlet private weak var descLAbel: UILabel!
    @IBOutlet private weak var adressLabel: UILabel!
    
    private var url: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        imageSlider.delegate = self
        interactor?.handle(request: SelectedCampDetail.CampDetail.Request())
    }

    private func sliderSetup(images: [String]) {
        let images: [InputSource] = []
        imageSlider.slideshowInterval = 7.0
        imageSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        imageSlider.contentScaleMode = UIViewContentMode.scaleAspectFit
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = Colors.brownColor
        pageControl.pageIndicatorTintColor = Colors.greenColor
        imageSlider.pageIndicator = pageControl
        imageSlider.setImageInputs(images)
        imageSlider.activityIndicator = DefaultActivityIndicator()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        imageSlider.addGestureRecognizer(recognizer)
    }

    @IBAction func tapBack(_ sender: Any) {
        router?.routeToBack()
    }
    
    func display(viewModel: SelectedCampDetail.CampDetail.ViewModel) {
        imageSlider.isHidden = viewModel.place.images.isEmpty
        
        if !viewModel.place.images.isEmpty {
            sliderSetup(images: viewModel.place.images)
        }
        
        adressLabel.text = viewModel.place.formattedAddress
        descLAbel.text = viewModel.place.description
        
        shareView.isHidden = !(viewModel.place.deepLink != "")
        self.url = viewModel.place.deepLink
    }
    
    @IBAction func tapShare(_ sender: Any) {
        let url = URL(string: self.url)
        let vc = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(vc, animated: true)
    }
    
    @objc func didTap() {
        let fullScreenController = imageSlider.presentFullScreenController(from: self)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: UIActivityIndicatorView.Style.medium, color: .white)
    }
    
    func display(viewModel: SelectedCampDetail.Error.ViewModel) {
        router?.routeToBack()
    }
}

extension SelectedCampDetailViewController: ImageSlideshowDelegate {
    
}
