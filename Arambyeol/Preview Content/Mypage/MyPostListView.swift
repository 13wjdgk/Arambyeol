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
                           PostDetailView()
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
