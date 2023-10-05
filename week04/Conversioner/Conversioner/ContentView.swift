//
//  ContentView.swift
//  Conversioner
//
//  Created by Drew Brown on 10/4/23.
//


//  Challenge from https://www.hackingwithswift.com/100/swiftui/19
//  Conversion values from https://www.google.com/search?q=length+converter

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnits = "km"
    @State private var outputUnits = "mi"
    @FocusState private var inputIsFocused: Bool
    
    
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
                        .focused($inputIsFocused)

                    Picker("Unit", selection: $inputUnits){
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input value")
                }
                HStack{
                    Spacer()
                    Button {
                        let tempStore = inputUnits
                        inputValue = outputValue
                        inputUnits = outputUnits
                        outputUnits = tempStore
                    } label: {
                        HStack{
                            Text("Swap")
                            Image(systemName: "arrow.triangle.swap")
                        }
                    }
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
            
           
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
