//
//  SeatSelectionView.swift
//  karabilet
//
//  Created by mahmut kara on 25.06.2023.
//

import SwiftUI

struct SeatSelectionView: View {
    
    @State var bookedSeats: [Int] = [0,1,2,10,25,30,41,59,73,54,55]
    @State var selectedSeats : [Int] = []

    var body: some View {
        
        let totalSeats = 84
        
        let leftSide = 0..<totalSeats/2
        let rightSide = totalSeats/2..<totalSeats
        
        VStack {
        
            HStack(spacing: 30){
            let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 3)
            
            LazyVGrid(columns: columns, spacing: 15, content: {
                ForEach(leftSide, id: \.self) { index in
                    
                    let seat = index >= 10 ? index : index
                    
                    SeatView(index: index, seat: seat, seatNumber: String(seat+1), selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                    
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            if selectedSeats.contains(seat) {
                                selectedSeats.removeAll{ (removeSeat) -> Bool in
                                    return removeSeat == seat
                                }
                                return
                            }
                            selectedSeats.append(seat)
                        }.disabled(bookedSeats.contains(seat))
                }
            })
            
            LazyVGrid(columns: columns, spacing: 15, content: {
                ForEach(rightSide, id: \.self) { index in
                    
                    let seat = index >= 35 ? index : index
                    
                    SeatView(index: index, seat: seat, seatNumber: String(seat+1), selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if selectedSeats.contains(seat) {
                                selectedSeats.removeAll{ (removeSeat) -> Bool in
                                    return removeSeat == seat
                                }
                                return
                            }
                            selectedSeats.append(seat)
                        }.disabled(bookedSeats.contains(seat))
                }
            })
        }.padding()
            .padding(.top,30)
            .padding(.horizontal)
        HStack(spacing: 15){
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray)
                .frame(width: 20, height: 20)
                .overlay(
                    Image(systemName: "xmark")
                        .font(.caption)
                        .foregroundColor(.gray)
                )
            Text("Dolu")
                .font(.caption)
                .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.purple,lineWidth: 3)
                .frame(width: 20, height: 20)

            Text("Boş")
                .font(.caption)
                .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 4)
                .fill(.purple)
                .frame(width: 20, height: 20)

            Text("Seçilen")
                .font(.caption)
                .foregroundColor(.gray)
            }
            .padding(.top,15)
            
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("\(selectedSeats.count) Koltuk")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("\(selectedSeats.count * 200)₺")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }).frame(width: 100)
                
                Button(action: {}, label: {
                    Text("Satın Al")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,16)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                })
            }.padding()
                .padding(.top,10)
            
        }
    }
}

struct SeatView: View {
    var index: Int
    var seat: Int
    var seatNumber: String
    @Binding var selectedSeats: [Int]
    @Binding var bookedSeats: [Int]
    
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .stroke(bookedSeats.contains(seat) ? Color.gray : Color.purple,lineWidth: 4)
                .frame(height: 30)
                .background(
                    selectedSeats.contains(seat) ? Color.purple : Color.clear
                )
            
            if bookedSeats.contains(seat) {
                Text("Dolu")
                    .foregroundColor(.gray)
                //Image(systemName: "xmark")
                Text(seatNumber)
                    .fontWeight(.semibold)
                    .font(.callout)
                    .foregroundColor(Color.clear)
            } else {
                Text(seatNumber)
                    .fontWeight(.semibold)
                    .font(.callout)
                    .foregroundColor(
                        selectedSeats.contains(seat) ? Color.white : Color.gray
                    )
            }
        }
    }
}

struct SeatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SeatSelectionView()
    }
}
