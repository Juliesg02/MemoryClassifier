//
//  BlockView.swift
//  MemoryClassifier
//
//  Created by Julio Enrique Sanchez Guajardo on 12/12/24.
//

import SwiftUI

struct BlockView: View {
    var body: some View {
        
        
        HStack {
            VStack {
                Text("00")
                    .font(.title)
                    .fontWeight(.bold)
                Text("THU")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(Color.gray)
                
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text("Food with friends")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    Text("I enjoy to use my phone to take pictures of food with friends.")
                        .italic()
                }
                .font(.headline)
                .fontWeight(.regular)
                
                Spacer()
                
                Text("😍")
                    .font(.largeTitle)
                    .padding(.horizontal)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    BlockView()
}
