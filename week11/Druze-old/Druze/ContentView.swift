//
//  ContentView.swift
//  Druze
//
//  Created by drew on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var rect1 = DruzeRectangle(pos: CGPoint(x: 0, y: 0), w: 100, h: 100, bg: CGColor(red: 0, green: 1, blue: 0, alpha: 1))
    
    
    var body: some View {
        ZStack {
            DruzeRectangleView(rect: rect1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
        
        
//        if(rect1.selected) {
//            HStack {
//                Button("+ Size") {
//                    rect1.w += 5
//                    rect1.h += 5
//                }
//                Button("- Size") {
//                    if(rect1.w > 50) {
//                        rect1.w -= 5
//                        rect1.h -= 5
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
