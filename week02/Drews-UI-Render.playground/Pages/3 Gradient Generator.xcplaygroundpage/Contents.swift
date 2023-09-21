//: [Previous](@previous)
//: [Next](@next)


import Foundation
import UIKit


let w = 255
let h = 255

let renderer = UIGraphicsImageRenderer(size: CGSize(width: w, height: h))

let image = renderer.image { (context) in
    
    for x in stride(from: 0, to: w, by: 5) {
        for y in stride(from: 0, to: h, by: 5){
            

//            Red Gradient
            UIColor(red: 255/255, green: CGFloat(x)/255, blue: CGFloat(y)/255, alpha: 1).setFill()
            
//            Green Gradient
//            UIColor(red: CGFloat(y)/255, green: 255/255, blue: CGFloat(x)/255, alpha: 1).setFill()

//            Blue Gradient
//            UIColor(red: CGFloat(y)/255, green: CGFloat(x)/255, blue: 255/255, alpha: 1).setFill()


            context.fill(CGRect(x: x, y: y, width: 5, height: 5))
        }
    }
}

image
