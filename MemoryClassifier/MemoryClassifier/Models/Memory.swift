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
    var doubleSentimentScore: Double = 0.0
    
    var formattedMonth: String { date.formatted(.dateTime.month(.abbreviated)) }
    var formattedWeekDay: String { date.formatted(.dateTime.weekday(.abbreviated)) }
    var formattedDay: String {
        date.formatted(.dateTime.day(.twoDigits))
    }

    
    init(title: String = "", textDescription: String = "", date: Date = Date.now, sentimentEmoji: String = "😶", sentimentScore: String = "0.0") {
        self.title = title
        self.textDescription = textDescription
        self.date = date
        self.sentimentEmoji = sentimentEmoji
        self.sentimentScore = sentimentScore
        self.doubleSentimentScore = Double((sentimentScore as NSString).floatValue)
    }
    
}

