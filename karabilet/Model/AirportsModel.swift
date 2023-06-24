//
//  Model.swift
//  karabilet
//
//  Created by mahmut kara on 19.06.2023.
//

import Foundation


struct Airport: Codable, Identifiable, Hashable{
    
    static func == (lhs: Airport, rhs: Airport) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    let name: String
    let city: String
    let country: String
    let iataCode: String

    
    private enum CodingKeys: String, CodingKey {
        case name
        case city
        case country
        case iataCode = "iata_code"
    }
}


