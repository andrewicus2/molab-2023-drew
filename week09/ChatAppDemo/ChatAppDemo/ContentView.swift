//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by drew on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
        
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageID) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("LtBlue"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

#Preview {
    ContentView()
}
