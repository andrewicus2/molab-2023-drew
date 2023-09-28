//
//  ContentView.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//

import SwiftUI

struct BrokeImage: View {
    var body: some View {
        VStack{
            Image(possibleImages[displayedImage])
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
