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
    @State private var path = [Memory]()
    
    var body: some View {
        NavigationStack (path: $path) {
            MemoriesListView()
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("Memory Classifier")
            .navigationDestination(for: Memory.self, destination: MemoryView.init)
            .toolbar {
                //Button("Add Sample", action: addSamples)
                Button("Add Destination", systemImage: "plus", action: addDestination)

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
    
    func addDestination() {
        let memory = Memory()
        modelContext.insert(memory)
        path = [memory]
    }
    
}

#Preview {
    ContentView()
}
