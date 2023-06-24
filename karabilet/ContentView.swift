//
//  ContentView.swift
//  karabilet
//
//  Created by mahmut kara on 19.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale,Locale.init(identifier: "tr"))
    }
}
