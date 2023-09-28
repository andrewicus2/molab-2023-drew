//
//  SquiggleDraws.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//

import SwiftUI

struct SquiggleDraws: View {
    var body: some View {
        VStack {
            Text("Squiggle Lines")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Canvas{context, size in
                    let w = size.width
                    let h = size.height
                    let randomP = Path() { path in
                        path.move(to: CGPoint(x: .random(in: 0...w), y: .random(in: 0...h)))
                        for i in 1...10 {
                            path.addLine(to: CGPoint(x: .random(in: 0...w), y: .random(in: 0...h)))
                        }
                    }
                    
                    context.stroke(randomP, with: .color(.white), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                }
                .frame(width: 300, height: 200)
                .background(randomColor().opacity(0.5))
                .cornerRadius(20)
                .shadow(radius: 5)
            }
        }
    }
}

struct SquiggleDraws_Previews: PreviewProvider {
    static var previews: some View {
        SquiggleDraws()
    }
}
