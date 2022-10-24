//
//  GetPlacesFetcher.swift
//  CampApp
//
//  Created by cem sezeroglu on 20.10.2022.
//

import Foundation

class GetPlacesFetcher {
    static let shared = GetPlacesFetcher()
    
    func getPlaces() -> [PlaceEntity]? {
        var placeEntity: [PlaceEntity] = []
        var images: [String] = []
        
        guard let data = readLocalJSONFile(forName: "places") else { return nil }
        
        let places = decode(jsonData: data)?.places
        
        for place in places ?? [] {
            
            guard place.isActive == true else { continue }
            images.removeAll()
            
            place.images?.forEach({ image in
                images.append(image.imageUrl ?? "")
            })
            
            placeEntity.append(
                PlaceEntity(
                    title: place.title ?? "",
                    images: images,
                    city: place.city ?? "",
                    country: place.country ?? "",
                    latitute: place.location?.lat ?? 0.0,
                    longitute: place.location?.lng ?? 0.0,
                    fromPrice: place.fromPrice ?? 0,
                    toPrice: place.toPrice ?? 0,
                    currency: place.currency ?? "",
                    hasElectricity: place.hasElectricity ?? false,
                    petsAllowed: place.petsAllowed ?? false,
                    accommodationTypes: place.accommodationTypes ?? [],
                    lastModifiedDate: place.lastModifiedDate ?? "",
                    description: place.placeDescription ?? "",
                    formattedAddress: place.formattedAddress ?? "",
                    streetAddress: place.streetAddress ?? "",
                    coverImage: place.coverImage ?? "",
                    deepLink: place.deepLink ?? ""
                )
            )
        }
        
        return placeEntity
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return nil
    }
    
    private func decode(jsonData: Data) -> Places? {
        do {
            let decodedData = try JSONDecoder().decode(Places.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return nil
    }
}
