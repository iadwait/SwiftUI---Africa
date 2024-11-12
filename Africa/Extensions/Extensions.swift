//
//  Extensions.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ file: String, parsingType: T.Type) -> T {
        // 1.Locate JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // 2.Create Property for Data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        // 3.Create a Decoder
        let decoder = JSONDecoder()
        // 4.Create a property for the decoded data
        guard let loaded = try? decoder.decode(parsingType, from: data) else {
            fatalError("Failed to decode \(file) in bundle")
        }
        // 5. Return the ready-to-use data
        return loaded
    }
    
}
