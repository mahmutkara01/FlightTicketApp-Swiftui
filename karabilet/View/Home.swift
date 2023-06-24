//
//  Home.swift
//  karabilet
//
//  Created by mahmut kara on 19.06.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            arkaplan()
            
            VStack(spacing:5){
            HStack(alignment: .center){
                Text("Uçak Bileti Satın Al")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 35))
                    .foregroundColor(Color.secondary)
            }.padding(.horizontal,30)
            
            ScrollView{
                
                VStack{
                    SelectAirportCell(selectedDepartureAirportID: "", selectedArrivalAirportID: "")
                        .frame(width: 360,height: 330)
                        .cornerRadius(30)
                        .shadow(radius: 5,x:2,y:1)
                        .padding()
                    Spacer()
                }
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
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
