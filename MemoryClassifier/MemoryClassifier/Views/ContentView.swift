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
                .sheet(isPresented: $isShowingSheet) {
                    NavigationView {
                        Form {
                            Section (header: Text("Title of your memory")){
                                TextField("Title", text: $title)
                            }
                            
                            Section (header: Text("How do you feel?")){
                                TextField("Memory", text: $description, axis: .vertical)
                            }
                            
                        }
                        .navigationTitle("Sheet")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Save") {
                                    // Code here
                                    //Add info to swift data
                                    //Remove text
                                    isShowingSheet.toggle()
                                }
                            }
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Cancel") {
                                    // Add your cancel action here
                                    isShowingSheet.toggle()
                                }
                                .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
