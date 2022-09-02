//
//  PostCell.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//

import SwiftUI

struct PostCell: View {
    var post : Post
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                
                Text(post.title).font(.system(size: 15))
                HStack{
//                    Text("파란코끼리").font(.system(size: 12))
//                    Text("|").font(.system(size: 12))
                    Text("오늘의 점심").font(.system(size: 12))
                    Text("|").font(.system(size: 12))
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("회색별").resizable().frame(width: 15, height: 15)
                    Spacer()
                    Text("파란코끼리").font(.system(size: 12))
                }
        }
        }.padding()
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(post_id: 0, title: "Test", category: "카테고리", nickname: "nickname", score: 5, insertDate: Date.now))
    }
}
