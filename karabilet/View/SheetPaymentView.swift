//
//  PaymentView.swift
//  karabilet
//
//  Created by mahmut kara on 25.06.2023.
//

import SwiftUI

struct SheetPaymentView: View {
    @State private var seatSelectionSheet = false
    @State var departureAirport: Airport?
    @State var arrivalAirport: Airport?
    @State var sonFiyat: Int = 0
    @State var kSaat: String = "10.55"
    @State var vSaat: String = "12.55"
    @State var kTuru: String = "Economy"
    

    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading,spacing: 15) {
                        Text("Özet")
                            .font(.custom("Sen-Regular", size: 20))
                            .foregroundColor(Color.black)
                            .fontWeight(.black)
                        VStack{
                            HStack{
                                Image(systemName: "airplane.departure")
                                    .frame(width: 15,height: 15)
                                    .padding(.vertical)
                                    .padding(.horizontal)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading,spacing: 5){
                                    Text("\(departureAirport?.name ?? "Sivas Havalimanı")")
                                        .font(.custom("Sen-Bold", size: 20))
                                        .lineLimit(1)
                                    Text("Departure: \(kSaat)")
                                        .font(.custom("Sen-Regular", size: 15))
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                
                                Spacer()
                                
                                }

                            HStack{
                                Image(systemName: "airplane.arrival")
                                    .frame(width: 15,height: 15)
                                    .padding(.vertical)
                                    .padding(.horizontal)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading,spacing: 5){
                                    Text("\(arrivalAirport?.name ?? "Sivas Havalimanı")")
                                        .font(.custom("Sen-Bold", size: 20))
                                        .lineLimit(1)
                                    Text("Arrival: \(vSaat)")
                                        .font(.custom("Sen-Regular", size: 15))
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                
                                Spacer()
                                
                                }
                        }
                    }
                }
                Divider()
                    .padding(10)
                VStack(alignment: .leading,spacing: 5){
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text(kTuru)
                                .font(.custom("Sen-Bold", size: 15))
                                .padding(.vertical,5)
                                .padding(.horizontal,10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                            Text("\(sonFiyat)₺")
                                .font(.custom("Sen-Bold", size: 25))
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button(action: {
                            seatSelectionSheet = true
                        }, label: {
                            Text("Devam et")
                                .font(.custom("Sen-ExtraBold", size: 15))
                                .padding(.vertical,15)
                                .padding(.horizontal,20)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        })
                        .sheet(isPresented: $seatSelectionSheet) {
                            VStack {
                                SeatSelectionView(departureAirport: departureAirport,arrivalAirport: arrivalAirport,sonucFiyat: sonFiyat, kSaat: kSaat)
                                    
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
