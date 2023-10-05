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
            VStack{
            Text("Random images")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text("(No longer broken)")
                .font(.subheadline)
                .foregroundColor(Color.secondary)
                .padding(.bottom, 20.0)
            Image(displayedImage)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            Text("\(displayedImage)")
                .foregroundColor(.secondary)
            Spacer()
            Button(action: generateImage) {
                Text("Generate Image")
                    .font(.title2)
                    .fontWeight(.regular)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(15)
            .padding()
        }
        
    }
}

struct BrokenImage_Previews: PreviewProvider {
    static var previews: some View {
        BrokeImage()
    }
}
