//
//  BuyTicketView.swift
//  karabilet
//
//  Created by mahmut kara on 18.07.2023.
//

import SwiftUI

struct BuyTicketView: View {
    @ObservedObject var viewmodele = TicketDao()
    
    var arrival_code: String = "arrival_code"
    var arrival_name: String = "arrival_name"
    var departure_code: String = "departure_code"
    var departure_name: String = "departure_name"
    var ticket_number: String = "ticket_number"
    
   /* func sil(at offset: IndexSet){
        let tickets = viewmodele.ticketList[offset.first!]
        viewmodele.sil(tickets: tickets)
    } */
    
    var body: some View {
        VStack{
            ScrollView{
                
                    ForEach(viewmodele.ticketList, id: \.self) { ticket in
                        ZStack{
                            MyTicketShape()
                                .frame(width: 350,height: 120)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            VStack{
                                ZStack {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(ticket.departure_name ?? "")
                                                .font(.custom("Sen-Bold", size: 20.0, relativeTo: .title3))
                                            Text(ticket.departure_code ?? "")
                                                .font(.custom("Sen-Regular", size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Text(ticket.arrival_name ?? "")
                                                .font(.custom("Sen-Bold", size: 20.0, relativeTo: .title3))
                                            Text(ticket.arrival_code ?? "")
                                                .font(.custom("Sen-Regular", size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                        }
                                    }.padding(5)
                                    Image(systemName: "airplane")
                                        .font(.title3)
                                        .foregroundColor(.gray)
                                }
                                
                                Line()
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    .frame(height: 1)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .offset(x:0,y: 16)
                                
                                HStack {
                                    VStack(alignment: .leading){
                                            Text("Ticket Number")
                                                .font(.custom("Sen-Regular", size: 10))
                                                .foregroundColor(.gray)
                                            Text(ticket.ticket_number ?? "")
                                                .font(.custom("Sen-Bold", size: 15))
                                            
                                    }.padding(.leading)
                                    Spacer()
                                }.padding(.top,15)
                                
                            }.padding(10)
                        }
                        
                    }
                }.onAppear{
                    viewmodele.ticketList.removeAll()
                    viewmodele.ticketYukle()
            }
        }.padding(.horizontal, 12.0)
            .padding(.top, 10)
            .padding(.bottom, 8.0)
            .frame(maxWidth: .infinity)
            .cornerRadius(12).shadow(radius: 5,x:2,y:1).padding(.horizontal)
            
    }
}

struct BuyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BuyTicketView()
    }
}
