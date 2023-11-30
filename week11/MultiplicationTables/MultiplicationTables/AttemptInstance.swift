//
//  AttemptInstance.swift
//  MultiplicationTables
//
//  Created by drew on 11/16/23.
//

import Foundation

struct AttemptInstance: Identifiable, Codable {
    var id = UUID()
    let tableVal: Int
    let numQuestions: Int
    let score: Int
}
