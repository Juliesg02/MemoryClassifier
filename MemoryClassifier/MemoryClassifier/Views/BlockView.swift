//
//  BlockView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 12/12/24.
//

import SwiftUI

struct BlockView: View {
    
    let memory: Memory
    
    var body: some View {

        HStack {
            VStack {
                Text(memory.formattedDay)
                    .font(.title)
                    .fontWeight(.bold)
                Text(memory.formattedWeekDay)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(Color.gray)
                
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text(memory.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    Text(memory.textDescription)
                        .italic()
                }
                .font(.headline)
                .fontWeight(.regular)
                
                Spacer()
                
                Text(memory.sentimentEmoji)
                    .font(.largeTitle)
                    .padding(.horizontal)
            }
            .padding()
            .frame(maxWidth: .infinity)
            //.background(Color.white)
            //.cornerRadius(30)
            //.shadow(radius: 4)
        }
    }
}

#Preview {
    BlockView(memory: Memory(title: "Food with friends", textDescription: "I love food with friends", date: .now, sentimentEmoji: "😍", sentimentScore: "1.0"))
}
