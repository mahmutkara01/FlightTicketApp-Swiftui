//
//  TicketDao.swift
//  karabilet
//
//  Created by mahmut kara on 18.07.2023.
//

import Foundation

class TicketDao : ObservableObject {
    @Published var ticketList = [Ticket]()
    let context = persistentContainer.viewContext
    
    func ticketYukle(){
        do{
            let liste = try context.fetch(Ticket.fetchRequest())
            ticketList = liste
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func sil(tickets:Ticket){
        context.delete(tickets)
        saveContext()
        ticketYukle()
    }
    
}
