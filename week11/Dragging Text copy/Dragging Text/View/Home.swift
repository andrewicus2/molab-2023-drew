//
//  Home.swift
//  Dragging Text
//
//  Created by drew on 11/24/23.
//

import SwiftUI

struct Home: View {
    @StateObject var canvasModel: CanvasViewModel = .init()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            // MARK: Canvas View
            Canvas()
                .environmentObject(canvasModel)
                .onTapGesture(count: 1) {
                    canvasModel.selected?.selected = false
                    canvasModel.selected = nil
                }
            
            if(canvasModel.selected != nil) {
                HStack() {
                    Button {
                        canvasModel.deleteActive()
                    } label: {
                        Image(systemName: "trash")
                            .font(.title3)
                    }
                    
                    Button {
                        canvasModel.moveActiveToFront()
                    } label: {
                        Image(systemName: "square.2.layers.3d.top.filled")
                            .font(.title3)
                    }
                    
                    Button {
                        canvasModel.moveActiveToBack()
                    } label: {
                        Image(systemName: "square.2.layers.3d.bottom.filled")
                            .font(.title3)
                    }
                }
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            
            // MARK: Canvas Actions
            HStack() {
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        canvasModel.showImagePicker.toggle()
                    } label: {
                        Image(systemName: "photo")
                            .font(.title3)
                    }
                    Button {
                        canvasModel.addShapeToStack()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }
                }
            }
            .foregroundStyle(.white)
            .padding()
            .background(.black)
            .frame(maxHeight: .infinity, alignment: .top)
            
            Button {
                
            } label: {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

        }
        .preferredColorScheme(.dark)
        .alert(canvasModel.errorMessage, isPresented: $canvasModel.showError) {}
        .sheet(isPresented: $canvasModel.showImagePicker) {
            if let image = UIImage(data: canvasModel.imageData) {
                canvasModel.addImageToStack(image: image)
            }
        } content: {
            ImagePicker(showPicker: $canvasModel.showImagePicker, imageData: $canvasModel.imageData)
        }
    }
}

#Preview {
    Home()
}
