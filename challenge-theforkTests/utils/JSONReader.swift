//
//  asd.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 06/12/2022.
//

import Foundation

class JSONReader {
    
    private init() {}
    
    static func read<T: Decodable>(file name: String, objectType: T.Type) -> T? {
        if let localData = self.readLocalFile(forName: name) {
            do {
                return try JSONDecoder().decode(T.self, from: localData)
            } catch {
                fatalError("Error when parsing \(T.self)")
            }
        }
        return nil
    }
    
    private static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle(for: self).path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
}
