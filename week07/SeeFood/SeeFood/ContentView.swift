//
//  ContentView.swift
//  SeeFood
//
//  Created by drew on 10/19/23.
//

import CoreML
import Vision
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func identifyImage() -> String {
        do {
            let config = MLModelConfiguration()
            
            let model = try VNCoreMLModel(for: HotDogNotHotDog(configuration: config).model)
            let request = VNCoreMLRequest(model: model, completionHandler: myResultsMethod)
            let handler = VNImageRequestHandler
            handler.perform(request)

                        
            return prediction
        } catch {
            print("Sorry, there was a problem with the model!")
        }
                
        return ""
    }
}

#Preview {
    ContentView()
}
