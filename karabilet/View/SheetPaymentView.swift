//
//  PaymentView.swift
//  karabilet
//
//  Created by mahmut kara on 25.06.2023.
//

import SwiftUI

struct SheetPaymentView: View {
    @State private var seatSelectionSheet = false
    var departureAirport: Airport?
    var arrivalAirport: Airport?
    var sonFiyat: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Özet")
                            .foregroundColor(Color.black)
                            .fontWeight(.black)
                        HStack{
                            VStack{
                                Image(systemName: "airplane.departure")
                                Text("\(departureAirport?.name ?? "")")
                                    .font(.title3)
                                    .lineLimit(1)
                            }
                            Circle()
                                .stroke(lineWidth: 2.0)
                                .fill(Color.teal)
                                .frame(width: 6.0, height: 6.0)
                            Rectangle()
                                .fill(Color.teal)
                                .frame(height: 1.0)
                            Circle()
                                .stroke(lineWidth: 2.0)
                                .fill(Color.teal)
                                .frame(width: 6.0, height: 6.0)
                            VStack{
                                Image(systemName: "airplane.arrival")
                                Text("\(arrivalAirport?.name ?? "")")
                                    .font(.title3)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
                Divider()
                VStack(alignment: .leading,spacing: 5){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Toplam Fiyat")
                                .font(.callout)
                                .foregroundColor(.gray)
                                
                            Text("\(sonFiyat)₺")
                                .fontWeight(.semibold)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button(action: {
                            seatSelectionSheet = true
                        }, label: {
                           //NavigationLink(destination: SeatSelectionView()){
                                Text("Devam et")
                                    .fontWeight(.semibold)
                                    .padding(.vertical,10)
                                    .padding(.horizontal,25)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                       
                           // }
                        })
                        .sheet(isPresented: $seatSelectionSheet) {
                            VStack {
                                SeatSelectionView(departureAirport: departureAirport,arrivalAirport: arrivalAirport,sonucFiyat: sonFiyat)
                                    
                            }
                        }
                    }
                }
            }.frame(maxWidth: 350)
        }
    }
}

 struct SheetPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SheetPaymentView()
    }
}
