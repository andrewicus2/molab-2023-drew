//: [Previous](@previous)
//: [Next](@next)

import UIKit

// Read in an image from a url string
func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

let jotchua = imageFor("https://preview.redd.it/z1xnw3l28pz61.png?auto=webp&s=30e5bd010e7e84ab68d00ee2eb360de55f6de2af")


let dog = imageFor("https://media.giphy.com/media/l4FGI8GoTL7N4DsyI/giphy.gif")

let sun = imageFor("https://media.giphy.com/media/jDPJmNhDsTV9OviMkv/giphy.gif")

let sky = UIImage(named: "HD-Blue-Sky-Wallpaper.jpg")!

let trees = imageFor("https://i.pinimg.com/originals/67/32/91/673291ffc700ec3d752035de856b5f39.png")

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))

let image = renderer.image { (context) in
    sky.draw(in:CGRect(x: 0, y: 0, width: 2048, height: 1560))
    trees.draw(in:CGRect(x: 0, y:730, width: 1600, height: 294))
    dog.draw(in: CGRect(x: -250, y: 300, width: 1000, height: 860))
    sun.draw(in: CGRect(x: 500, y: -50, width: 600, height: 600))
}

image
