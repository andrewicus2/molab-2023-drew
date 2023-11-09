//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by drew on 11/9/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("LtGray") : Color("LtBlue"))
                    .cornerRadius(15, corners: message.received ? [.topLeft, .topRight, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
    }
}

#Preview {
    MessageBubble(message: Message(id: "12345", text: "Hello, wiejfowijefowijefowjieofjwefjioweijfowiejfowijefowjieofjwoefworld!", received: false, timestamp: Date()))
}
