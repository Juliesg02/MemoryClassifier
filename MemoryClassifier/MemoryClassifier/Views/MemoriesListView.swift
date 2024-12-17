//
//  MemoriesListView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 17/12/24.
//
import SwiftData
import SwiftUI

struct MemoriesListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Memory.date, order: .reverse) var memories: [Memory]

    var body: some View {
        List {
            ForEach(memories) { memory in
                NavigationLink(value: memory) {
                    BlockView(memory: memory)
                        .listRowSeparator(.hidden)
                }
            }
            .onDelete(perform: deleteMemory)
        }
    }
    
    func deleteMemory(_ indexSet: IndexSet) {
        for index in indexSet {
            let memory = memories[index]
            modelContext.delete(memory)
        }
    }
}

#Preview {
    MemoriesListView()
}
