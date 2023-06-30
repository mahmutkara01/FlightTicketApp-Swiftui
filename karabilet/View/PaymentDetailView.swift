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
                                .font(.title)
                                .foregroundColor(.gray)
                                .lineLimit(2)
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
