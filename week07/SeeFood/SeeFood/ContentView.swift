//
//  ContentView.swift
//  SeeFood
//
//  Created by drew on 10/19/23.
//

//https://medium.com/@ios_guru/swiftui-and-image-recognition-77d6622a2a7c


import CoreML
import Vision
import SwiftUI

extension UIImage {
    
    // https://www.hackingwithswift.com/whats-new-in-ios-11
    func toCVPixelBuffer() -> CVPixelBuffer? {
           
           let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
             var pixelBuffer : CVPixelBuffer?
             let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
             guard (status == kCVReturnSuccess) else {
               return nil
             }

             CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
             let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

             let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
             let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

             context?.translateBy(x: 0, y: self.size.height)
             context?.scaleBy(x: 1.0, y: -1.0)

             UIGraphicsPushContext(context!)
             self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
             UIGraphicsPopContext()
             CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

             return pixelBuffer
       }
}

struct ContentView: View {
    
    var imageClassifier: SeeFoodClassifier?
    
    @State private var classLabel: String = ""
    
    @State private var imageSel = Int.random(in: 1..<11)

    
    init() {
        do {
        imageClassifier = try SeeFoodClassifier(configuration: MLModelConfiguration())
        } catch {
            print(error)
        }
    }
        
    var body: some View {
        VStack {
            Image("food\(imageSel)")
                .resizable()
                .frame(width: 300, height: 200)
            Button("Run") {
                identifyImage(image: imageSel)
            }
                .padding()
            Text("Image is \(classLabel)")
            Button("New Image") {
                imageSel = Int.random(in: 1..<11)
            }
        }
        .padding()
    }
    
    func identifyImage(image: Int) {
        guard let uiImage = UIImage(named: "food\(image)") else { return }
        guard let pixelBuffer = uiImage.toCVPixelBuffer() else { return }

        do {
            
            let result = try imageClassifier?.prediction(image: pixelBuffer)
    
            classLabel = result?.target ?? ""
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
