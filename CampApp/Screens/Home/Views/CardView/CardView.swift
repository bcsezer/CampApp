//
//  CardView.swift
//  CampApp
//
//  Created by cem sezeroglu on 22.10.2022.
//

import UIKit

protocol CardViewDelegate: AnyObject {
    func didPressView(data: PlaceEntity)
}

class CardView: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var petIcon: UIImageView!
    @IBOutlet private weak var vehicleIcon: UIImageView!
    @IBOutlet private weak var tentIcon: UIImageView!
    @IBOutlet private weak var electricIcon: UIImageView!
    @IBOutlet private weak var caravanIcon: UIImageView!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var clickableView: UIView!
    @IBOutlet private weak var cardImage: UIImageView!
    
    weak var delegate: CardViewDelegate?
    var placeEntity: PlaceEntity?
    
    // MARK: Initiliazers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Private Functions
    private func setup() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
        apperance()
    }
    
    private func setGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickView))
        clickableView.addGestureRecognizer(gesture)
    }
    
    @objc func clickView() {
        guard let data = self.placeEntity else { return }
        delegate?.didPressView(data: data)
    }
    
    private func apperance() {
        setGesture()
        titleLabel.textColor = Colors.greenColor
        cardImage.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10.0)
        
        mainView.style(style: ViewStyle(
            backgroundColor: Colors.white,
            tintColor: nil,
            layerStyle: ViewStyle.LayerStyle(
                masksToBounds: true,
                cornerRadius: 10.0,
                borderStyle: nil
            )
        )
        )
    }
    
    func show() {
        self.fadeIn(duration: 0.2)
    }
    
    func hide() {
        self.fadeOut(duration: 0)
    }
    
    @IBAction func TapCancel(_ sender: Any) {
        hide()
    }
    
    func updateView(data: PlaceEntity) {
        self.placeEntity = data
        
        self.titleLabel.text = placeEntity?.title
        self.priceLabel.text = "Price:\(data.fromPrice) - \(data.toPrice) \(data.currency)"
        self.petIcon.isHidden = !data.petsAllowed
        self.electricIcon.isHidden = !data.hasElectricity
        self.cardImage.setImage(imgUrl: data.coverImage)
        
        if !data.accommodationTypes.isEmpty {
            for accTypes in data.accommodationTypes {
                vehicleIcon.isHidden = !(AccommodationTypes(rawValue: accTypes) == .vehicle)
                caravanIcon.isHidden = !(AccommodationTypes(rawValue: accTypes) == .caravan)
                tentIcon.isHidden = !(AccommodationTypes(rawValue: accTypes) == .tent)
            }
        }
    }
}
