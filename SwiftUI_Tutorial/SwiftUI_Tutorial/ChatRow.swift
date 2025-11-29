//
//  ChatRow.swift
//  SwiftUI_Tutorial
//
//  Created by 박정환 on 11/22/25.
//

import SwiftUI

struct ChatRow: View {
    let chatRoom: ChatRoomModel // 모델 추가

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack {
                if let profileImage = chatRoom.profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                else {
                    Circle()
                        .frame(width: 40, height: 40)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(chatRoom.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)

                    Text(chatRoom.location)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }

                Text(chatRoom.lastMessage)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }

            Spacer()

            if let thumbnail = chatRoom.thumbnail {
                thumbnail
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}
