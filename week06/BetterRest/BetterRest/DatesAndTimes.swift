//
//  DatesAndTimes.swift
//  BetterRest
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct DatesAndTimes: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
    
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

#Preview {
    DatesAndTimes()
}
