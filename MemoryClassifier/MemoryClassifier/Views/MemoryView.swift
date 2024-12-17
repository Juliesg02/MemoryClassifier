//
//  MemoryView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 16/12/24.
//
import SwiftData
import SwiftUI

struct MemoryView: View {

    @Bindable var memory: Memory
        
    var body: some View {
        NavigationView {
            Form {
                
                Section (header: Text("Date of your memory")) {
                    DatePicker("Date", selection: $memory.date, in: ...Date.now, displayedComponents: .date)
                        .labelsHidden()
                }
                
                Section (header: Text("Title of your memory")){
                    TextField("Title", text: $memory.title)
                }
                
                Section (header: Text("How do you feel?")){
                    TextField("Memory", text: $memory.textDescription, axis: .vertical)
                }
                .onChange(of: memory.textDescription, calculateSentimentScore)
                
                


            }
            .navigationTitle("Memory")
        }
    }
    func calculateSentimentScore(){
        if let averageTokenizedSentimentScore = calculateAverageTokenizedSentimentScore(from: memory.textDescription) {
            memory.sentimentScore = averageTokenizedSentimentScore
            memory.sentimentEmoji = sentimentString(for: averageTokenizedSentimentScore)
        }
    }
}




//
//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Memory.self, configuration: config)
//        
//        let example = Memory(title: "Food with friends", textDescription: "I love food with friends", date: .now, sentimentEmoji: "😍", sentimentScore: "1.0")
//        
//        return MemoryView(memory: example)
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container")
//        
//    }
//}
