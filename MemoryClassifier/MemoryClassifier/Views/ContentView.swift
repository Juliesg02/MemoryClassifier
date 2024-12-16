//
//  ContentView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSheet = false
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach (0..<10) { _ in
                        BlockView()
                    }
                    .padding()
                }
            }
            .navigationTitle("Memory Classifier")
            .toolbar {
                Button("Add") {
                    isShowingSheet.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
