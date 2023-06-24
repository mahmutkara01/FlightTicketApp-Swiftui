//
//  SelectAirportCell.swift
//  karabilet
//
//  Created by mahmut kara on 20.06.2023.
//

import SwiftUI

struct SelectAirportCell: View {
    @ObservedObject var viewmodel = AirportsViewModel()
    @State var selectedDepartureAirportID: String
    @State var selectedArrivalAirportID: String
    @State private var DepartureDate = Date()
    @State private var ArrivalDate = Date()

    var body: some View {

        VStack{
            NavigationView {
                VStack(alignment: .leading){
                    Section {
                        VStack{
                            Picker(selection: $selectedDepartureAirportID) {
                                ForEach(viewmodel.airports, id: \.iataCode) { item in
                                    HStack {
                                        VStack(alignment: .leading, spacing:5){
                                            Text(item.name + " Havalimanı")
                                                .font(.headline)
                                                .font(.system(size: 15))
                                                .lineLimit(2)
                                                .tag(item.iataCode)
                                            Text(item.city)
                                                .font(.callout)
                                                .tag(item.iataCode)
                                        }
                                        Spacer(minLength: 10)
                                    }.tag(item.iataCode)
                                }
                            } label: {
                                Image(systemName: "airplane.departure")
                                    .font(.system(size: 24))
                                    .padding(.trailing,5)
                            }
                            .pickerStyle(.navigationLink)
                            .foregroundColor(Color.black.opacity(0.8))
                        }
                        
                        VStack{
                            Picker(selection: $selectedArrivalAirportID) {
                                ForEach(viewmodel.airports, id: \.iataCode) { item in
                                    HStack {
                                        VStack(alignment: .leading, spacing:5){
                                            Text(item.name + " Havalimanı")
                                                .font(.headline)
                                                .font(.system(size: 15))
                                                .lineLimit(2)
                                                .tag(item.iataCode)
                                            Text(item.city)
                                                .font(.callout)
                                        }
                                        Spacer(minLength: 10)
                                    }.tag(item.iataCode)
                                }
                            } label: {
                                Image(systemName: "airplane.arrival")
                                    .font(.system(size: 24))
                                    .padding(.trailing,5)
                            }
                            .pickerStyle(.navigationLink)
                            .foregroundColor(Color.black.opacity(0.8))
                        }
                        
                        HStack{
                            VStack(alignment: .leading,spacing: 5){
                                Text("Gidiş")
                                    .padding(.leading,10)
                                SelectDate(Date: $ArrivalDate)
                            }
                            Divider()
                            VStack(alignment: .leading,spacing: 5){
                                Text("Dönüş")
                                    .padding(.leading,10)
                                SelectDate(Date: $DepartureDate)
                            }
                        }
                    
                    }.frame(width: 300,height: 60)
                        .padding(.vertical,5)
                        .padding(.horizontal)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black.opacity(0.5), lineWidth: 0.5))

                    Button{
                        
                    } label: {
                        NavigationLink(destination: AvaliableDates(departureAirport: viewmodel.airports.first(where: { $0.iataCode == selectedDepartureAirportID }),arrivalAirport: viewmodel.airports.first(where: { $0.iataCode == selectedArrivalAirportID }), viewmodel: viewmodel)) {
                            Text("Sefer Ara")
                                .fontWeight(.heavy)
                                .frame(width: 300,height: 5)
                                .padding(.vertical,30)
                                .padding(.horizontal)
                                .foregroundColor(Color.white)
                                .background(Color.secondary)
                                .cornerRadius(15)
                             }
                    }
                }
            }
        }.onAppear(perform: {
            viewmodel.airports.removeAll()
            viewmodel.fetchData()
        })
    }
}


/* struct SelectAirportCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectAirportCell(DepartureAirport: "", ArrivalAirport: "")
    }
} */

struct SelectDate: View {
    @Binding var Date: Date
    var body: some View {
        VStack(alignment:.leading,spacing: 5){

            DatePicker("", selection: $Date,
                       in: Foundation.Date()...,
                       displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .environment(\.locale, Locale(identifier: "tr"))

        }
    }
}

