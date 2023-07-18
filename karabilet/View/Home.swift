//
//  Home.swift
//  karabilet
//
//  Created by mahmut kara on 19.06.2023.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewmodele = TicketDao()
    @ObservedObject var viewmodel = AirportsViewModel()
    
    var body: some View {
        ZStack {
            arkaplan()
            
            VStack(spacing:5){
            HStack{
                Text("Uçak Bileti Satın Al")
                    .font(.custom("Sen-ExtraBold", size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 35))
                    .foregroundColor(Color.secondary)
            }.padding(.horizontal,35)
            
            
            VStack{
                SelectAirportCell(selectedDepartureAirportID: "", selectedArrivalAirportID: "")
                    .frame(width: 360,height: 330)
                    .cornerRadius(30)
                    .shadow(radius: 5,x:2,y:1)
                    .padding()
                
                    VStack{
                        HStack{
                            NavigationLink(destination: BuyTicketView()) {
                                Text("Son Uçuşlarım")
                                    .font(.custom("Sen-Regular", size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                                    .bold()
                            }
                        }.padding(.horizontal)
                        ScrollView{
                            BuyTicketView()
                    }
                }.padding(.horizontal)
            }
        }.padding(.top)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct arkaplan: View {
    var body: some View {
        VStack {
            Image("bg") // Arka plan görseli
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 260)
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
        }
    }
}
