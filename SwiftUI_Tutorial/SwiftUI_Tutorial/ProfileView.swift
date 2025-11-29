//
//  ProfileView.swift
//  SwiftUI_Tutorial
//
//  Created by 박정환 on 11/22/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ScrollView {
                VStack(spacing: 16) {
                    Circle()
                        .frame(width: 120, height: 120)

                    HStack{
                        Text("이명진")
                        Text("iOS")
                        Text("팟장")
                    }
                    
                    HStack{
                        Text("이명진")
                            .foregroundStyle(Color(.blue))
                        Text("iOS")
                        
                        Spacer()
                        
                        Text("팟장")
                    }
                    
                    HStack{
                        Text("이명진")
                            .foregroundStyle(Color(.blue))
                        Text("iOS")
                        
                        Spacer()
                        
                        Text("팟장")
                    }
                    
                    Text("취미는 잠자기")
                        .padding(.top, 440)
                }
            }
            directMessageButton
                .frame(height: 50)
        }
        .padding(.horizontal, 20)
    }
    
    private var nameWithPosition: some View {
        HStack {
            Text("iOS")
                .font(.subheadline)
            Text("이명진")
                .font(.headline)
                .foregroundStyle(.blue)
            Spacer()
            Text("파트장")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
    }

    private var ageAndMBTI: some View {
        HStack {
            Text("97년생")
                .font(.subheadline)
            Spacer()
            Text("ESTP거나 ESTJ")
                .font(.subheadline)
                .foregroundStyle(.indigo)
        }
    }

    private var hobby: some View {
        Text("취미는 영상편집, 러닝, 카공 등")
    }

    private var directMessageButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ProfileView()
}
