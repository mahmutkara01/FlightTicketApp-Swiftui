//
//  AvaliableDatesCell.swift
//  karabilet
//
//  Created by mahmut kara on 20.06.2023.
//

import SwiftUI

struct MyTicketShape: Shape {
    func path (in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.58721*height))
        path.addCurve (to: CGPoint(x: 0.97807*width, y: 0.67442*height), control1: CGPoint(x: 0.98789*width, y: 0.58721*height), control2: CGPoint(x: 0.97807*width, y: 0.62626*height))
        path.addCurve (to: CGPoint(x: width, y: 0.76163*height), control1:
                        CGPoint(x: 0.97807*width, y: 0.72258*height), control2: CGPoint(x: 0.98789*width, y: 0.76163*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0.75581*height))
        path.addCurve (to: CGPoint(x: 0.02193*width, y: 0.6686*height), control1: CGPoint(x: 0.01211*width, y: 0.75581*height), control2: CGPoint(x: 0.02193*width, y: 0.71677*height))
        path.addCurve (to: CGPoint(x: 0, y: 0.5814*height), control1: CGPoint(x: 0.02193*width, y: 0.62044*height), control2: CGPoint(x: 0.01211*width, y: 0.5814*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


struct AvaliableDatesCell: View {
    
    var departureAirport: Airport?
    var arrivalAirport: Airport?
    var sonFiyat: Int = 0
    var kSaat: String = "10.55"
    var vSaat: String = "12.55"
    var tSaat: String = "2 saat"
    var kTuru: String = "premium"
    
    var body: some View {
        ZStack{
            MyTicketShape()
                .frame(width: 350,height: 130)
                .foregroundColor(.white)
                .cornerRadius(10)
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text(kSaat)
                            .font(.custom("Sen-Regular", size: 20.0, relativeTo: .title3))
                        Text(departureAirport?.name ?? "yok")
                            .font(.custom("Sen-Regular", size: 15))
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
                            
                           Text(tSaat)
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
                        Text(vSaat)
                            .font(.custom("Sen-Regular", size: 20.0, relativeTo: .title3))
                        Text(arrivalAirport?.name ?? "yok")
                            .font(.custom("Sen-Regular", size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
                
                Line()
                   .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                   .frame(height: 1)
                   .foregroundColor(Color.gray.opacity(0.5))
                
                HStack(alignment: .center){
                    Text(kTuru)
                        .font(.custom("Sen-Bold", size: 15))
                    Spacer()
                    Text("\(sonFiyat)₺")
                        .font(.custom("Sen-Bold", size: 20))
                        .cornerRadius(15)
                }.padding(.top,5)
                
            }.padding(.horizontal, 12.0)
                .padding(.top, 25.0)
                .padding(.bottom, 8.0)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
        }
    }
}

struct AvaliableDatesCell_Previews: PreviewProvider {
    static var previews: some View {
            AvaliableDatesCell()
            
    }
}
