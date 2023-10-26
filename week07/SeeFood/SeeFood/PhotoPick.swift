//
//  PhotosPicker.swift
//  SeeFood
//
//  Created by drew on 10/26/23.
//

import SwiftUI
import PhotosUI

struct PhotoPick: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?

    var body: some View {
        VStack {
            PhotosPicker(selection: $avatarItem, matching: .images) {
                Text("Select Photo")
            }

            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }

                print("Failed")
            }
        }
    }
}

#Preview {
    PhotoPick()
}
