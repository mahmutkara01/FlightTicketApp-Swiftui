//
//  RandomTicketNumber+extension.swift
//  karabilet
//
//  Created by mahmut kara on 19.07.2023.
//

import Foundation

func generateRandomString(length: Int) -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}
