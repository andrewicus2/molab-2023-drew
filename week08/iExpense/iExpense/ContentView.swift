//
//  ContentView.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(expenses.items) { item in
                        if(item.type == "Personal"){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(item.amount < 10 ? .green :  .red)
                                    .fontWeight(item.amount < 100 ? .regular : .bold)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: { Text("Personal")}

                Section {
                    ForEach(expenses.items) { item in
                        if(item.type == "Business"){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(item.amount < 10 ? .green :  .red)
                                    .fontWeight(item.amount < 100 ? .regular : .bold)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: { Text("Business")}
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
