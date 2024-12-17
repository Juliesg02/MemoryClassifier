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
    
        init(sort: SortDescriptor<Memory>) {
    
            _memories = Query(sort: [sort])
        }
    
    func deleteMemory(_ indexSet: IndexSet) {
        for index in indexSet {
            let memory = memories[index]
            modelContext.delete(memory)
            try? modelContext.save()
        }
    }
}

#Preview {
    MemoriesListView(sort: SortDescriptor(\Memory.date, order: .reverse))
}
