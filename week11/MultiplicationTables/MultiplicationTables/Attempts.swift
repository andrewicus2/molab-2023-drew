//
//  Attempts.swift
//  MultiplicationTables
//
//  Created by drew on 11/16/23.
//

import Foundation

@Observable
class Attempts {
    var items = [AttemptInstance]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([AttemptInstance].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

