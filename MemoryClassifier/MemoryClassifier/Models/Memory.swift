//
//  Memory.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 16/12/24.
//

import SwiftData
import Foundation

@Model
class Memory {
    var title: String
    var textDescription: String
    var date : Date
    var sentimentEmoji : String
    var sentimentScore : String
    
    
    init(title: String = "", textDescription: String = "", date: Date = Date.now, sentimentEmoji: String = "😶", sentimentScore: String = "0.0") {
        self.title = title
        self.textDescription = textDescription
        self.date = date
        self.sentimentEmoji = sentimentEmoji
        self.sentimentScore = sentimentScore
    }
}

