//: [Previous](@previous)
//: [Next](@next)



import Foundation
import UIKit

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))

let image = renderer.image { (context) in
    for offset in stride(from: 0, to: 200, by: 5) {
        for number in stride(from: 0, to: 200, by: 10){
//            print(number)
            UIColor(red: CGFloat(number)/255, green: CGFloat(number)/255, blue: 255/255, alpha: 1).setFill()
            context.cgContext.fillEllipse(in: CGRect(x: number+offset, y: number, width: 20, height: 20))
        }
    }
//    UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1).setFill()
//    context.cgContext.fillEllipse(in: CGRect(x: 100, y: 100, width: 140, height: 140))
}

image
