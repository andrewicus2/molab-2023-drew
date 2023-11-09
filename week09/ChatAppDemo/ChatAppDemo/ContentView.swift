//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by drew on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hello!", "How are you doing?", "I've been great!"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            .background(Color("Blue"))
            
            MessageField()
        }
    }
}

#Preview {
    ContentView()
}
