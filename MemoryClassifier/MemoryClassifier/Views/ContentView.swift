//
//  ContentView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ForEach (0..<3) { _ in
                        BlockView()
                    }
                }
                .padding()
                
                
                //Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button( action: {
                            print("Add")
                        }, label : {
                            AddButtonView()
                        })
                        
                    }
                }
                .padding(.bottom, 30)
                .padding(.trailing, 20)
                
            }.navigationTitle("Memory Classifier")
        }
    }
    
}

#Preview {
    ContentView()
}
