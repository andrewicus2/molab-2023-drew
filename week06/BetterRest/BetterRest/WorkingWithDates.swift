//
//  WorkingWithDates.swift
//  BetterRest
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct WorkingWithDates: View {
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
    }
    
    func exampleDates() {
        //        var components = DateComponents()
        //        components.hour = 8
        //        components.minute = 0
        //        let date = Calendar.current.date(from: components) ?? .now
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    WorkingWithDates()
}
