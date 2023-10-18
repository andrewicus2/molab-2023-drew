//
//  NumbersWithStepper.swift
//  BetterRest
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct NumbersWithStepper: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    NumbersWithStepper()
}
