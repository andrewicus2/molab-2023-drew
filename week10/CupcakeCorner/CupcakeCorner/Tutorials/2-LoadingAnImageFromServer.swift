//
//  2-LoadingAnImageFromServer.swift
//  CupcakeCorner
//
//  Created by drew on 11/15/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/loading-an-image-from-a-remote-server

import SwiftUI

struct LoadingAnImageFromServer: View {
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) // 3x Scale
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
        
        
    }
}

#Preview {
    LoadingAnImageFromServer()
}
