//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by 박정환 on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(.profile)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("이띵진")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("문정동이 누구야")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text("확인했습니다 감사합니다?")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Image(.watch)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(4)
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}

