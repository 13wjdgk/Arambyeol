//
//  PostView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        
            NavigationView {
                List{
                    ForEach(PostList){ post in
                        PostCell(post: post).listRowBackground(Color.white).foregroundColor(.black)
                    }
                }
                .navigationTitle("아람 후기 게시판").navigationBarTitleDisplayMode(.inline).toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button{} label: {
                            Image(systemName: "magnifyingglass").foregroundColor(.white)
                        }
                    }
                    ToolbarItemGroup {
                        Button{} label: {
                            Image(systemName: "pencil").foregroundColor(.white)
                        }
                    }
                }
            }.environment(\.colorScheme, .dark)
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
