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
            Text(post.title)
            Text(post.nickname)
        }
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(post_id: 0, title: "Test", category: "카테고리", nickname: "nickname", score: 5, insertDate: Date.now))
    }
}
