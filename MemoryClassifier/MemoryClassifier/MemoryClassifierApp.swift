//
//  MemoryClassifierApp.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 09/12/24.
//
import SwiftData    
import SwiftUI

@main
struct MemoryClassifierApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Memory.self) //this create the modelcontext
    }
}
