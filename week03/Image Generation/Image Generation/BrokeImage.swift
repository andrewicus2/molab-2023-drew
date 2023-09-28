//
//  ContentView.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//

import SwiftUI


struct BrokeImage: View {
    
    let possibleImages = ["minionz", "cats", "dog"]

    @State var displayedImage = "cats"
    
    func generateImage(){
        displayedImage = possibleImages.randomElement()!
    }
    
    var body: some View {
        VStack{
            Text("Flips through 3 random images")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 5.0)
            Text("(No longer broken)")
                .font(.subheadline)
                .foregroundColor(Color.secondary)
                .padding(.bottom, 30.0)
            Image(displayedImage)
                .resizable()
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            Button(action: generateImage) {
                Text("Generate Image")
            }
            .buttonStyle(.bordered)
        }
        
    }
}

struct BrokenImage_Previews: PreviewProvider {
    static var previews: some View {
        BrokeImage()
    }
}
