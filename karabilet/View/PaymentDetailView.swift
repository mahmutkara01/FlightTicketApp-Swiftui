//
//  PaymentDetailView.swift
//  karabilet
//
//  Created by mahmut kara on 25.06.2023.
//

import SwiftUI

struct PaymentDetailView: View {
    
    var departureAirport: Airport?
    var arrivalAirport: Airport?
    var sonFiyat: Int = 0
    var koltuk : [Int] = []
    var kSaat: String = ""
    @State private var ticket_number: String = generateRandomString(length: 6)
    @State private var terminal_number: String = generateRandomString(length: 2)
    var viewmodel = TicketSaveViewModel()
    @State private var isOnaylaButtonPressed = false
    
    var body: some View {
        
        VStack(spacing: 5){
            Image("flight")
                .resizable()
                .scaledToFill()
                .frame(width: 330,height: 120)
                .cornerRadius(15)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Ticket Number")
                        .font(.custom("Sen-Regular", size: 15))
                        .foregroundColor(.gray)
                    Text(ticket_number)
                        .font(.custom("Sen-Bold", size: 20))
                        .foregroundColor(.black)
                }
                .padding(.top)
                Spacer()
            }
            VStack{
                Divider()
                ZStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text(departureAirport?.iataCode ?? "VAS")
                                .font(.custom("Sen-Bold", size: 30))
                            
                            Text(departureAirport?.name ?? "sivas")
                                .font(.custom("Sen-Regular", size: 20))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text(arrivalAirport?.iataCode ?? "VAS")
                                .font(.custom("Sen-Bold", size: 30))
                            
                            Text(arrivalAirport?.name ?? "sivas")
                                .font(.custom("Sen-Regular", size: 20))
                                .foregroundColor(.gray)
                        }
                    }
                    Image(systemName: "airplane")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                
                Divider()
                
                VStack(spacing: 15){
                    HStack(spacing: 10){
                        VStack(alignment: .leading){
                            Text("Time")
                                .font(.custom("Sen-Regular", size: 15))
                                .foregroundColor(.gray)
                            Text(kSaat)
                                .font(.custom("Sen-Bold", size: 20))
                                .bold()
                                .foregroundColor(.black)
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Seat")
                                .font(.custom("Sen-Regular", size: 15))
                                .foregroundColor(.gray)
                            HStack{
                                ForEach(koltuk, id: \.self) { seat in
                                    Text("\(seat+1)")
                                        .font(.custom("Sen-Regular", size: 20))
                                        .padding(.horizontal,2)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Terminal")
                                .font(.custom("Sen-Regular", size: 15))
                                .foregroundColor(.gray)
                            Text(terminal_number)
                                .font(.custom("Sen-Bold", size: 20))
                                .bold()
                                .foregroundColor(.black)
                        }
                    }.padding(.top)
                }
            }.padding(.vertical)
            
            Button(action: {
                
                viewmodel.kaydet(arrival_code: arrivalAirport?.iataCode ?? "hata", arrival_name: arrivalAirport?.city ?? "hata", departure_code: departureAirport?.iataCode ?? "hata", departure_name: departureAirport?.city ?? "hata", ticket_number: ticket_number)
                
                isOnaylaButtonPressed = true

            }) {
                
                Text("Onayla")
                    .font(.custom("Sen-ExtraBold", size: 20))
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }


        }.padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 10,x:2,y:4)
            .padding()
            .onAppear {
                self.ticket_number = generateRandomString(length: 6)
            }
       /* VStack{
            
            HStack{
                VStack(alignment: .leading){
                    Text(departureAirport?.name ?? "Sivas")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(departureAirport?.iataCode ?? "VAS")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text(arrivalAirport?.name ?? "Ankara")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(arrivalAirport?.iataCode ?? "EST")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            }
            HStack{
                VStack(alignment: .leading,spacing: 10){
                    Text("Fiyat")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(sonFiyat)₺")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing,spacing: 10){
                    Text("Koltuk")
                        .font(.title3)
                        .fontWeight(.bold)
                    HStack{
                        ForEach(koltuk, id: \.self) { seat in
                            Text("\(seat+1)")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                        }
                    }
                }
            }.padding(.top)
            
        }.frame(width: 260) */
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView()
    }
}
