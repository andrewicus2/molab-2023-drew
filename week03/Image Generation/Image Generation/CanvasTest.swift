//
//  CanvasTest.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//  https://designcode.io/swiftui-handbook-canvas
//

import SwiftUI


let names = ["Cool Canvas", "Lines!", "Sweet Style", "Nice Drawing", "Beautiful Color"]

func randomColor() -> Color {
    return Color (
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1)
    )
}

struct CanvasTest: View {
    var body: some View {
        
        VStack {
            Text("Pattern Lines")
                .font(.largeTitle)
                .fontWeight(.bold)
       
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                VStack(alignment: .leading){
                    Text(names.randomElement()!)
                        .font(.title2)
                        .fontWeight(.regular)
                    Canvas{context, size in
                        let w = size.width
                        let h = size.height
                        
                        var opa:Double = 1;
                        
                        for xOff in stride(from: 5, to: w, by: 20) {
                            let linesP = Path() { path in
                                path.move(to: CGPoint(x: .random(in: 0...30)+xOff, y: 30))
                                path.addLine(to: CGPoint(x: 30+xOff, y: h/3))
                                path.addLine(to: CGPoint(x: 30+xOff, y: h/(.random(in: 1.5...3))))
                                path.addLine(to: CGPoint(x: .random(in: 0...30)+xOff, y: h-30))
                            }
                            context.stroke(linesP, with: .color(randomColor().opacity(opa)), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            
                            
                            opa -= 0.08
                        }
                        
                    }
                    .frame(width: 300, height: 200)
                    .background(randomColor().opacity(0.5))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                }
            }
        }
    }
}




struct CanvasTest_Previews: PreviewProvider {
    static var previews: some View {
        CanvasTest()
    }
}
