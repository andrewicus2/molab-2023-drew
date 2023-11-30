//
//  CustRectangle.swift
//  Druze
//
//  Created by drew on 11/16/23.
//

import SwiftUI

struct DruzeRectangleView: View {
    @State var rect: DruzeRectangle
    
    var body: some View {
        ZStack {
            if(rect.selected) {
                Rectangle()
                    .stroke(.green, lineWidth: 5)
            }
            Rectangle()
                .fill(Color(cgColor: rect.bg))
        }
        .frame(width: CGFloat(rect.w), height: CGFloat(rect.h))
        .position(rect.pos)
        .onTapGesture {
            rect.selected = true
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    rect.pos = gesture.location
                }
                .onEnded { _ in
                    rect.selected = true
                }
        )
            
 
    }
}

#Preview {
    DruzeRectangleView(rect: DruzeRectangle(pos: CGPoint(x: 10, y:10), w: 100, h: 100, bg: CGColor(red: 1, green: 0, blue: 0, alpha: 1)))
}

