//
//  ContentView.swift
//  Conversioner
//
//  Created by Drew Brown on 10/5/23.
//


//  Challenge from https://www.hackingwithswift.com/100/swiftui/19
//  Conversion values from https://www.google.com/search?q=length+converter

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnits = "km"
    @State private var outputUnits = "mi"
    
    
    let units = ["m", "km", "ft", "y", "mi"]
    
    var toMeters: Double {
        switch inputUnits {
            case "m":
                return inputValue
            case "km":
                return inputValue * 1000
            case "ft":
                return inputValue / 3.281
            case "y":
                return inputValue / 1.094
            case "mi":
                return inputValue * 1609
            default:
                return 0
        }
    }
    
    var outputValue: Double {
        switch outputUnits{
            case "m":
                return toMeters
            case "km":
                return toMeters / 1000
            case "ft":
                return toMeters * 3.281
            case "y":
                return toMeters * 1.094
            case "mi":
                return toMeters / 1609
            default:
                return 0
        }
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Input value", value: $inputValue, format: .number, prompt: Text("Enter a number"))
                        .keyboardType(.decimalPad)
                    Picker("Unit", selection: $inputUnits){
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input value")
                }
                
                
                Section{
                    Picker("Unit", selection: $outputUnits){
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputValue)")
                } header: {
                    Text("Converted value")
                }
            }
            .navigationTitle("Conversioner")
        }
    }
}

#Preview {
    ContentView()
}
