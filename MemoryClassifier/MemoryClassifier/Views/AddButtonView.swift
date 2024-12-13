//
//  AddButtonView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 13/12/24.
//
import SwiftUI

struct AddButtonView: View {
    var body: some View {
        
        
        
        ZStack {
            Circle()
                .foregroundStyle(Color.accentColor)
                .frame(width: 90, height: 90)
                .shadow(radius: 10)
            Image(systemName: "plus")
                .font(Font.system(size: 70))
                .foregroundColor(Color.white)
        }
    }
}
        
#Preview {
    AddButtonView()
}
