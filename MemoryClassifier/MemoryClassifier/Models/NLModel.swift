//
//  NLModel.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 15/12/24.
//

import Swift
import NaturalLanguage

let sentimentEmojis: [String] = [
    "🤬", "😡", "😠", "😤", "😫", "😣", "😔", "🙁", "😕", "😑",
    "😶", "😌", "🙂", "😊", "😋", "😄", "😆", "😏", "😎", "🤩", "😍"
]

func sentimentString (for sentimentScore: String) -> String {
    let emojiIndex = Int((sentimentScore as NSString).floatValue * 10) + 10
    return "\(sentimentEmojis[emojiIndex]) (\(sentimentScore))"
}

func getSentimentScore (from text: String) -> String? {
    
    // 1
    let tagger = NLTagger(tagSchemes: [.tokenType, .sentimentScore])
    tagger.string = text
    var detectedSentiment: String?
    
    
    //2
    tagger.enumerateTags(in: text.startIndex ..< text.endIndex,
                         unit: .paragraph,
                         scheme: .sentimentScore,
                         options: []) { sentiment, _ in
        
        if let sentimentScore = sentiment {
            detectedSentiment = sentimentScore.rawValue
        }
        
        return true
    }
    
    return detectedSentiment
}

func getTokenizedSentimentScore(from text: String) -> [(String, String)]? {
    
    //1.
    let tokenizer = NLTokenizer(unit: .sentence)
    tokenizer.setLanguage(.english)
    tokenizer.string = text
    var detectedTokenizedSentiment = [(String, String)]()
    
    //2.
    tokenizer.enumerateTokens(in: text.startIndex ..< text.endIndex) { tokenRange, _ in
        if let sentimentScore = getSentimentScore(from: String(text[tokenRange])) {
            detectedTokenizedSentiment.append((String(text[tokenRange]), sentimentScore))
        }
        return true
    }
    
    return detectedTokenizedSentiment.isEmpty ? nil : detectedTokenizedSentiment
}

func calculateAverageTokenizedSentimentScore(from text: String) -> String? {
    var cumulativeSentimentScore = Double()
    var count = 0
    
    if let tokenizedSentimentScore = getTokenizedSentimentScore(from: text) {
        tokenizedSentimentScore.forEach { (textToke, sentimentScore) in
            
            cumulativeSentimentScore += (sentimentScore.isEmpty ? 0 : Double(sentimentScore)) ?? 0
            count += sentimentScore.isEmpty ? 0 : 1
        }
    }
    let averageSentimentScore = cumulativeSentimentScore / Double(count)
    let roundedAverageSentimentScore = String(round(averageSentimentScore * 10) / 10)
    
    return roundedAverageSentimentScore.isEmpty ? nil : roundedAverageSentimentScore
}
