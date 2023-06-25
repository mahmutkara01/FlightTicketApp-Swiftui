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
    var price: String = ""
    
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
        }.frame(width: 260)
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView()
    }
}
