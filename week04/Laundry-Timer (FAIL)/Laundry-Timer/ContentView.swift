//
//  ContentView.swift
//  Laundry-Timer
//
//  Created by Drew Brown on 10/4/23.
//

//  Built using this tutorial: https://www.youtube.com/watch?v=NAsQCNpodPI&ab_channel=Indently

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @State private var timerType = timerTypes.wash
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    enum timerTypes: String, Identifiable {
        case wash, dry
        var id: Self { self }
    }
    
    var body: some View {
        VStack {
            Text("\(vm.time)")
                .font(.system(size: 100, weight: .medium, design: .rounded))
                .padding()
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
                .alert("Timer done!", isPresented: $vm.showingAlert) {
                    Button("Continue", role: .cancel) {}
                }
            
            Picker("Timer", selection: $timerType){
                Text("Wash").tag(timerTypes.wash)
                Text("Dry").tag(timerTypes.dry)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if(timerType.rawValue == "Wash"){
            } else {
            }
            
            HStack {
                Button("Start") {
                    vm.start(minutes: vm.minutes)
                }
                .disabled(vm.isActive)
                
                Button("Reset") {
                    vm.reset()
                }
                .tint(.red)
            }
            .frame(width: width)
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
        
    }
}

#Preview {
    ContentView()
}
