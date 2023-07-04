//
//  AvaliableDatesVM.swift
//  karabilet
//
//  Created by mahmut kara on 2.07.2023.
//

import Foundation

class AvaliableDatesVM: ObservableObject{
    
    @Published var avDatesVM: [AvaliableDatesModel] = []
    
    func fetchData(){
        let BASE_URL = "https://mahmutkara.net"
        let PATH = "assets"
        let API_PATH = "uygunzamanlar.json"
        
        let api = "\(BASE_URL)/\(PATH)/\(API_PATH)"
        
        guard let url = URL(string: api) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([AvaliableDatesModel].self, from: data)
                    DispatchQueue.main.async {
                        self.avDatesVM = result
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
