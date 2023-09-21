import UIKit

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))


let image = renderer.image { (context) in
    UIColor.white.setStroke()
    context.stroke(renderer.format.bounds)
    
    UIColor(red: 158/255, green: 215/255, blue: 245/255, alpha: 1).setFill()
    context.fill(CGRect(x: 20, y: 20, width: 140, height: 140))
    
    UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 0.5).setFill()
    context.fill(CGRect(x: 10, y: 10, width: 50, height: 50))

    UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1).setFill()
    context.cgContext.fillEllipse(in: CGRect(x: 100, y: 100, width: 140, height: 140))
}

image

