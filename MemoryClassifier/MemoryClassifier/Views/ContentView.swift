//
//  ContentView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                ForEach (0..<7) { _ in
                    BlockView()
                }
            }
            .padding()
            
            VStack {
                
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 100, height: 100)
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
