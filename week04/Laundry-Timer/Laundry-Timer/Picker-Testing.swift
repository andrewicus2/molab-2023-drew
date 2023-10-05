//
//  Picker-Testing.swift
//  Laundry-Timer
//
//  Created by Drew Brown on 10/4/23.
//

import SwiftUI

struct Picker_Testing: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View{
        NavigationView{
            Form{
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self){
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    Picker_Testing()
}
