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
    @State var test = "머리카락"
    var body: some View {
       
            NavigationView {
                List{
                    ForEach(PostList){ post in
                        NavigationLink {
                           PostDetailView()
                        }label: {
                            PostCell(post: post).listRowBackground(Color.white)
                        }
                    }
                }
                .navigationTitle("아람 후기 게시판").navigationBarTitleDisplayMode(.inline).toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(
                            destination: SearchView(text: "", search:false,test: $test),
                            label: {
                                Label("Search", systemImage: "magnifyingglass").foregroundColor(.white)
                            })
                    }
  
                    ToolbarItemGroup {
                        NavigationLink(
                            destination: PostCreateView(star: 0),
                            label: {
                                Label("Search", systemImage: "pencil").foregroundColor(.white)
                            })
                    }
                    ToolbarItemGroup{
                        Button{
                            print("test : \($test)")
                        }label: {
                            Text("hi").foregroundColor(.white)
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
