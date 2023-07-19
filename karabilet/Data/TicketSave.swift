//
//  TicketSave.swift
//  karabilet
//
//  Created by mahmut kara on 18.07.2023.
//

import Foundation
import CoreData

class TicketSaveViewModel {
    let context = persistentContainer.viewContext
    
    func kaydet(arrival_code: String, arrival_name: String, departure_code: String, departure_name: String, ticket_number: String) {
        let ticket = Ticket(context: context)
        
        ticket.arrival_code = arrival_code
        ticket.arrival_name = arrival_name
        ticket.departure_code = departure_code
        ticket.departure_name = departure_name
        ticket.ticket_number = ticket_number
        
        saveContext()
    }
}
