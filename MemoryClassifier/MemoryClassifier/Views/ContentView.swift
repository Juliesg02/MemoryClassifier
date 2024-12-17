//
//  ContentView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//

import SwiftData
import SwiftUI

enum FilterValue {
    case All
    case Pleasant
    case Unpleasant
}


struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [Memory]()
    @State private var sortDate = SortDescriptor(\Memory.date, order: .reverse) //Default sort
    @State private var filterSentiment = FilterValue.All
    
    var body: some View {
        NavigationStack (path: $path) {
            MemoriesListView(sort: sortDate, filter: filterSentiment)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("Memory Classifier")
            .navigationDestination(for: Memory.self, destination: MemoryView.init)
            .toolbar {
                //Button("Add Sample", action: addSamples)
                Button("Add Destination", systemImage: "plus", action: addDestination)
                
                Menu ("Filter", systemImage: "arrow.up.arrow.down"){
                    Picker("Filter", selection: $sortDate) {
                        Text("Recent")
                            .tag(SortDescriptor(\Memory.date, order: .reverse))
                        Text("Oldest")
                            .tag(SortDescriptor(\Memory.date))
                    }
                    .pickerStyle(.inline)
                }
                
                Menu ("Filter", systemImage: "slider.horizontal.3"){
                    Picker("Filter", selection: $filterSentiment) {
                        Text("All")
                            .tag(FilterValue.All)
                        Text("Pleasant")
                            .tag(FilterValue.Pleasant)
                        Text("UnPleasant")
                            .tag(FilterValue.Unpleasant)
                    }
                    .pickerStyle(.inline)
                }
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
