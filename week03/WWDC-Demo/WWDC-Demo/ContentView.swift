//
//  ContentView.swift
//  WWDC-Demo
//
//  Created by Drew Brown on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            HStack{
                Image(systemName: "photo")
                
                VStack(alignment: .leading) {
                    Text("Rooms")
                    Text("20 people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
