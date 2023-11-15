//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false;
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@andrewicus")
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
