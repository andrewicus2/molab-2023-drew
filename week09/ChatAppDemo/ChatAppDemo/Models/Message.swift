//
//  Message.swift
//  ChatAppDemo
//
//  Created by drew on 11/9/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
