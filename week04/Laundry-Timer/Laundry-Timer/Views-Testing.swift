//
//  Views-Testing.swift
//  Laundry-Timer
//
//  Created by Drew Brown on 10/4/23.
//


// https://developer.apple.com/documentation/swiftui/model-data

import SwiftUI


struct Views_Testing: View {
    
    @State private var isLit = false;
    
    var body: some View {
        ZStack{
            if isLit{
                Rectangle()
                    .fill(Gradient(colors: [.yellow,.black]))
                    .ignoresSafeArea()
            } else {
                Rectangle()
                    .foregroundColor(Color.black)
                    .ignoresSafeArea()
            }
            
            
            VStack {
                if isLit {
                    Image(systemName: "lightbulb.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 225)
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "lightbulb")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Toggle("Illuminate!", isOn: $isLit)
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    Views_Testing()
}
