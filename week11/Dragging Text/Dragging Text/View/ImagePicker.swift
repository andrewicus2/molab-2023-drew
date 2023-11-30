//
//  ImagePicker.swift
//  Dragging Text
//
//  Created by drew on 11/24/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var showPicker: Bool
    @Binding var imageData: Data
    var quality: CGFloat = 0.45
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let image = results.first?.itemProvider{
                image.loadObject(ofClass: UIImage.self) { image, err in
                    if let data = (image as? UIImage)?.jpegData(compressionQuality: self.parent.quality) {
                        DispatchQueue.main.async {
                            self.parent.imageData = data
                            self.parent.showPicker.toggle()
                        }
                    } else {
                        self.parent.showPicker.toggle()
                    }
                }
            }
        }
    }
}
