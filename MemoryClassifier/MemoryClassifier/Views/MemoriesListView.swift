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
    
//    init(sort: SortDescriptor<Memory>, filter: FilterValue) {
//        
//        _memories = Query(filter: #Predicate {
//            
//            switch filter{
//            case .All:
//                true
//            case .Pleasant:
//                Int($0.sentimentScore)! >= 0
//            case .Unpleasant:
//                Int($0.sentimentScore)! < 0
//            }
//        }, sort: [sort])
//    }
    
    
//    init(sort: SortDescriptor<Memory>, filter: FilterValue) {
//        
//    //        let predicateAll = #Predicate<Memory> { memory in
//    //            true
//    //        }
//    //        let predicatePleasant = #Predicate<Memory> {
//    //            Int($0.sentimentScore)! >= 0 }
//    //        let predicateUnpleasant = #Predicate<Memory> {
//    //            Int($0.sentimentScore)! < 0 }
//    //
//    //        var finalPredicate: Predicate<Memory>
//    //
//    //        switch filter{
//    //        case .All:
//    //            finalPredicate = predicateAll
//    //        case .Pleasant:
//    //            finalPredicate = predicatePleasant
//    //        case .Unpleasant:
//    //            finalPredicate = predicateUnpleasant
//    //        }
//        _memories = Query(filter: #Predicate<Memory> { memory in
////            true
//            memory.intSentimentScore >= 0
//        }, sort: [sort])
//    }

        init(sort: SortDescriptor<Memory>, filter: FilterValue) {
    
            _memories = Query(sort: [sort])
        }
    
    func deleteMemory(_ indexSet: IndexSet) {
        for index in indexSet {
            let memory = memories[index]
            modelContext.delete(memory)
        }
    }
}

#Preview {
    MemoriesListView(sort: SortDescriptor(\Memory.date, order: .reverse), filter: FilterValue.All)
}
