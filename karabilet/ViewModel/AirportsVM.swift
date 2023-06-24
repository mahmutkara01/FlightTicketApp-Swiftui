//
//  AirportsVM.swift
//  karabilet
//
//  Created by mahmut kara on 20.06.2023.
//

import Foundation

class AirportsViewModel: ObservableObject{
    
    @Published var airports: [Airport] = []
    
    func fetchData(){

        let BASE_URL = "https://mahmutkara.net"
        let PATH = "assets"
        let API_PATH = "havalimanlari.json"
        
        let api = "\(BASE_URL)/\(PATH)/\(API_PATH)"
        
        guard let url = URL(string: api) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Airport].self, from: data)
                    DispatchQueue.main.async {
                        self.airports = result
                    }

                } else {
                    print("No Data")
                }
            } catch ( let error) {
                print(error.localizedDescription)
            }
        }.resume()

    }

}
