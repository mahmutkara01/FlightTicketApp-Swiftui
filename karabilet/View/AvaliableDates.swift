
//
//  SelectAirportCell.swift
//  karabilet
//
//  Created by mahmut kara on 20.06.2023.
//

import SwiftUI

struct AvaliableDates: View {
    
    var departureAirport: Airport?
    var arrivalAirport: Airport?
    @State private var showingPaymentPage: Bool = false
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        if let departure = departureAirport {
                            VStack(alignment: .leading,spacing: 5) {
                                Text(departure.iataCode)
                                    .font(.custom("Futura-Medium", size: 25.0, relativeTo: .title3))
                                Text(departure.city)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        } else {
                            Text("hata")
                                .font(.custom("Futura-Medium", size: 25.0, relativeTo: .title3))
                        }
                    }
                    Spacer()
                    VStack {
                        HStack(spacing: .zero) {
                            Circle()
                                .stroke(lineWidth: 2.0)
                                .fill(Color.teal)
                                .frame(width: 6.0, height: 6.0)
                            Rectangle()
                                .fill(Color.teal)
                                .frame(height: 1.0)
                            Image(systemName: "airplane")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24.0)
                                .foregroundColor(.teal)
                                .padding(.horizontal, 8.0)
                            Rectangle()
                                .fill(Color.teal)
                                .frame(height: 1.0)
                            Circle()
                                .stroke(lineWidth: 2.0)
                                .fill(Color.teal)
                                .frame(width: 6.0, height: 6.0)
                        }
                        Text("")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .offset(x: .zero, y: 4.0)
                    Spacer()
                    VStack(alignment: .trailing) {
                        if let arrival = arrivalAirport {
                            VStack(alignment: .trailing,spacing: 5) {
                                Text(arrival.iataCode)
                                    .font(.custom("Futura-Medium", size: 25.0, relativeTo: .title3))
                                Text(arrival.city)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            
                        } else {
                            Text("hata")
                                .font(.custom("Futura-Medium", size: 25.0, relativeTo: .title3))
                        }
                    }
                }
                .padding(.horizontal, 20.0)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.tertiarySystemBackground))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black.opacity(0.5), lineWidth: 2))
                .cornerRadius(15)
                .padding(.horizontal,15)
                
                Spacer()
                VStack{
                    ScrollView{
                        ForEach(1..<15) { _ in
                            VStack {
                                Button(action: {
                                    showingPaymentPage = true
                                }, label: {
                                    AvaliableDatesCell(departureAirport: departureAirport, arrivalAirport: arrivalAirport)
                                }).buttonStyle(PlainButtonStyle())
                            }
                            .sheet(isPresented: $showingPaymentPage) {
                              SheetPaymentView(departureAirport: departureAirport,arrivalAirport: arrivalAirport)
                              .presentationDetents([.height(200)])
                              }
                        }
                    }
                }.frame(width: 350,height: 600)
                    .padding(5)
                    .background(Color.gray.opacity(0.2)).cornerRadius(15).padding()
                
            }
        }
    }
}


/* struct AvaliableDates_Previews: PreviewProvider {
    static var previews: some View {
        AvaliableDates(viewmodel: Airports)
            .frame(height: 80.0)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
} */
