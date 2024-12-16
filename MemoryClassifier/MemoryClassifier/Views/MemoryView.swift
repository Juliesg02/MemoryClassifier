//
//  MemoryView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 16/12/24.
//

import SwiftUI

struct MemoryView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Title of your memory")){
                    TextField("Title", text: $title)
                }
                
                Section (header: Text("How do you feel?")){
                    TextField("Memory", text: $description, axis: .vertical)
                }
                
                Section (header: Text("Date of your memory")) {
                    DatePicker("Date", selection: $date)
                }
                
            }
            .navigationTitle("Memory")
        }
    }
}
#Preview {
    MemoryView()
}
