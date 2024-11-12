//
//  Utils.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import Foundation


class AppUtils {
    
    static let shared = AppUtils()
    
    func getCoverImagesData() -> [CoverImageModel] {
        return Bundle.main.decode("covers.json", parsingType: [CoverImageModel].self)
    }
    
    func getAnimalsData() -> [AnimalModel] {
        return Bundle.main.decode("animals.json", parsingType: [AnimalModel].self)
    }
    
    func getVideoData() -> [VideoModel] {
        return Bundle.main.decode("videos.json", parsingType: [VideoModel].self)
    }
    
    func getLocationData() -> [LocationModel] {
        return Bundle.main.decode("locations.json", parsingType: [LocationModel].self)
    }
    
}
