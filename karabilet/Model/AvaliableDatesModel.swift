//
//  AvaliableDatesModel.swift
//  karabilet
//
//  Created by mahmut kara on 2.07.2023.
//

import Foundation

struct AvaliableDatesModel: Codable, Identifiable{

    var id = UUID()
    let kSaat: String
    let vSaat: String
    let tSaat: String
    let kTuru: String
    let fiyat: Int

    private enum CodingKeys: String, CodingKey {
        case kSaat
        case vSaat
        case tSaat
        case kTuru
        case fiyat
    }
}
