//: [Previous](@previous)
//: [Next](@next)

import Foundation
import UIKit

let w = 255
let h = 255

let renderer = UIGraphicsImageRenderer(size: CGSize(width: w, height: h))
let snoop = UIImage(named: "Snoopy_The_Dog.jpeg")!
let font = UIFont.monospacedSystemFont(ofSize: 20, weight: UIFont.Weight(0.5))
let string = NSAttributedString(string: "Woof Woof!", attributes: [.font: font ])
let shadowColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha:0.1)

let image = renderer.image { (context) in
    
    //Draw Snoopy!
    snoop.draw(in: CGRect(x: 0, y: 0, width: 255, height: 255))
    
    //Set drop shadow
    context.cgContext.setShadow(offset: CGSize(width: 2, height: 2), blur: 20, color: shadowColor)
    UIColor.white.setFill()
    
    //Draw Rectangle
    context.fill(CGRect(x: 20, y: 20, width: 155, height: 35))

    //Remove drop shadow
    context.cgContext.setShadow(offset: .zero, blur: 0, color: nil)
    
    //Draw text
    string.draw(at: CGPoint(x: 40, y: 25))
}

image
