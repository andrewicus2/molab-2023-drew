//
//  ContentView.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        TabView{
            
            CanvasTest()
                .tabItem{
                    Image(systemName: "line.diagonal")
                    Text("Pattern Lines")
                }
            SquiggleDraws()
                .tabItem{
                    Image(systemName: "pencil.and.outline")
                    Text("Squiggle Lines")
                }
            BrokeImage()
                .tabItem{
                    Image(systemName: "photo")
                    Text("Random Image")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
