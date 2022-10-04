//
//  MyPostListView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI

struct MyPostListView: View {
    var body: some View {
                List{
                    ForEach(PostList){ post in
                        NavigationLink {
                            PostDetailView(post: Post(image: UIImage(), meal_time: "", post_id: 0, score: 0, title: "", nickname: ""), access_token: "")
                        }label: {
                            PostCell(post: post).listRowBackground(Color.white)
                        }
                    }
                }
    }
}

struct MyPostListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostListView()
    }
}
