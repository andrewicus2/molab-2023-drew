//
//  ContentView.swift
//  SeeFood
//
//  Created by drew on 10/19/23.
//

// https://medium.com/@ios_guru/swiftui-and-image-recognition-77d6622a2a7c


// https://www.youtube.com/watch?v=6_k0kXhRajo

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-select-pictures-using-photospicker

// https://static.wikia.nocookie.net/silicon-valley/images/d/da/SeeFood.jpg/revision/latest?cb=20180504153534


import CoreML
import Vision
import SwiftUI
import PhotosUI

struct ContentView: View {
    
    var imageClassifier: SeeFoodClassifier?
    
    @State private var classLabel: String?
    
    @State private var imageItem: PhotosPickerItem?
    @State private var imageSel: UIImage?
    
    
    init() {
        do {
            imageClassifier = try SeeFoodClassifier(configuration: MLModelConfiguration())
        } catch {
            print(error)
        }
    }
    var body: some View {
        ZStack {
            if let imageSel {
                Image(uiImage: imageSel)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Image("HotDog1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            VStack {
                if imageSel != nil {
                    VStack(spacing: -20) {
                        if(classLabel == "Not Hot Dog") {
                            Text(classLabel ?? "ERROR")
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .frame(maxWidth: .infinity, maxHeight: 120)
                                .background(Color.seeFoodRed)
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 3)
                            ZStack {
                                Color(Color.seeFoodRed)
                                    .frame(width: 100, height: 100)
                                    .clipShape(.circle)
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.white)
                            }
                            
                        } else {
                            Text(classLabel ?? "ERROR")
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .frame(maxWidth: .infinity, maxHeight: 120)
                                .background(Color.seeFoodGreen)
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 3)
                            ZStack {
                                Color(Color.seeFoodGreen)
                                    .frame(width: 100, height: 100)
                                    .clipShape(.circle)
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                } else {
                    VStack(spacing:0) {
                        Text("SEEFOOD")
                            .fontWeight(.heavy)
                            .font(.system(size: 65))
                            .frame(maxWidth: .infinity, maxHeight: 90)
                            .background(Color.seeFoodRed)
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 3)
                        
                        Text("'The Shazam for Food'")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.white)
                            .border(.black, width: 3)
                            .foregroundStyle(Color.seeFoodRed)
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                
                VStack {
                    PhotosPicker(selection: $imageItem, matching: .images) {
                        VStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(Color.seeFoodRed)
                                .background(.white)
                                .clipShape(.circle)
                            Text("Touch to SEEFOOD")
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .padding()
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 3)
                        }
                        
                    }
                }
                .onChange(of: imageItem) {
                    Task {
                        if let data = try? await imageItem?.loadTransferable(type: Data.self) {
                            imageSel = UIImage(data: data)
                        }
                        
                        if let imageSel {
                            identifyImage(uiImage: imageSel)
                        }
                        
                        print("Failed")
                    }
                }
            }
        }
    }
    
    func identifyImage(uiImage: UIImage) {
        guard let pixelBuffer = uiImage.toCVPixelBuffer() else { return }
        
        do {

//            let config = MLModelConfiguration()
//
//            let model = try VNCoreMLModel(for: HotDogNotHotDog(configuration: config).model)
//            let request = VNCoreMLRequest(model: model, completionHandler: myResultsMethod)
//            let handler = VNImageRequestHandler
//            handler.perform(request)
//            return prediction
            
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

