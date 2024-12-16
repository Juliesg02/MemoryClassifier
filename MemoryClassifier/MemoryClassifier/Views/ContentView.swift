//
//  ContentView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var memories: [Memory]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memories) { memory in
                    NavigationLink(value: memory) {
                        BlockView(memory: memory)
                            .listRowSeparator(.hidden)
                    }
                }
                .onDelete(perform: deleteMemory)
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("Memory Classifier")
            .navigationDestination(for: Memory.self, destination: MemoryView.init)
            .toolbar {
                Button("Add Sample", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let rome = Memory(title: "Food in Rome", textDescription: "I went to eat the best pizza in Rome")
        let paris = Memory(title: "Food in Paris", textDescription: "I went to eat the best baguette in Paris")
        let madrid = Memory(title: "Food in Madrid", textDescription: "I went to eat the best tapas in Madrid")
        
        modelContext.insert(rome)
        modelContext.insert(paris)
        modelContext.insert(madrid)
            }
    
    func deleteMemory(_ indexSet: IndexSet) {
        for index in indexSet {
            let memory = memories[index]
            modelContext.delete(memory)
        }
    }
}

#Preview {
    ContentView()
}
