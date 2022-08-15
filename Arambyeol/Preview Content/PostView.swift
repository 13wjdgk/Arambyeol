//
//  PostView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct PostView: View {
    @State private var CreatePost : Bool = false
    @State private var text : String = ""
    var body: some View {
       
            NavigationView {
                List{
                    ForEach(PostList){ post in
                        PostCell(post: post).listRowBackground(Color.white).foregroundColor(.black)
                    }
                }.searchable(text: $text)
                .navigationTitle("아람 후기 게시판").navigationBarTitleDisplayMode(.inline).toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button{} label: {
                            Image(systemName: "magnifyingglass").foregroundColor(.white)
                        }
                    }
                    ToolbarItemGroup {
                        NavigationLink(
                            destination: MypageView(),
                            label: {
                                Label("Search", systemImage: "pencil").foregroundColor(.white)
                            })
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
