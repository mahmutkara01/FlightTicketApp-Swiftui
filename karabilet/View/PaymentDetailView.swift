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
    
    var body: some View {
        VStack{
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
                    Text(departureAirport?.name ?? "Ankara")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(departureAirport?.iataCode ?? "EST")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Fiyat")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(sonFiyat)")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack{
                    Text("Koltuk")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack{
                        ForEach(koltuk, id: \.self) { seat in
                            Text("\(seat+1)")
                                .font(.callout)
                                .foregroundColor(.black)
                        }
                    }
                }
            }.padding(.top)
        }.frame(width: 260)
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView()
    }
}
