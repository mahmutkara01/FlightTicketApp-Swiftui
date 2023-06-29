//
//  AvaliableDatesCell.swift
//  karabilet
//
//  Created by mahmut kara on 20.06.2023.
//

import SwiftUI

struct AvaliableDatesCell: View {
    
    var departureAirport: Airport?
    var arrivalAirport: Airport?
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("19.45")
                        .font(.custom("Futura-Medium", size: 20.0, relativeTo: .title3))
                    Text(departureAirport?.name ?? "yok")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
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
                        
                       Text("1 Saat")
                            .lineLimit(1)
                            .font(.system(size: 15))
                            .padding(.vertical,2)
                            .padding(.horizontal,10)
                            .foregroundColor(.white)
                            .background(Color.purple.opacity(1))
                            .cornerRadius(15)
                            .frame(width: 65)
                            
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
                .offset(x: .zero, y: 0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("20.45")
                        .font(.custom("Futura-Medium", size: 20.0, relativeTo: .title3))
                    Text(arrivalAirport?.name ?? "yok")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
            }

            Divider()
            HStack(alignment: .center){
                Text("Business Class")
                    .font(.system(size: 15))
                    .font(.subheadline)
                Spacer()
                Text("2,000.0₺")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .cornerRadius(15)
            }
            
        }   .padding(.horizontal, 20.0)
            .padding(.top, 20.0)
            .padding(.bottom, 8.0)
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.tertiarySystemBackground))
            .cornerRadius(12)
    }
}

struct AvaliableDatesCell_Previews: PreviewProvider {
    static var previews: some View {
            AvaliableDatesCell()
            
    }
}
