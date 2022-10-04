//
//  PostView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct PostView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.user_id , order: .reverse)]) var usser : FetchedResults<User>
    @Binding var coreDM : CoreDataManager
    @State private var CreatePost : Bool = false
    @State private var text : String = ""
    @State var test = "머리카락"
    @State var user_info = ["",""]
    @State var Create_view = false
    @State var list_upload = false
    @State var postlist = PostList
    func removeRows(at offsets: IndexSet) {
        PostList.remove(atOffsets: offsets)
        list_upload = get_PostList(access_token: user_info[1], times: 0 )
        
        if list_upload {
            
            postlist = PostList
        }
    }
    var body: some View {
       
            NavigationView {
                List{
                    ForEach(postlist){ post in
                        NavigationLink {
                            PostDetailView(post : post, access_token: user_info[1])
                        }label: {
                            PostCell(post: post).listRowBackground(Color.white)
                        }
                    }.onDelete(perform: removeRows )
                }// 네비게이션 바
                .navigationTitle("아람 후기 게시판").navigationBarTitleDisplayMode(.inline).toolbar {
                    // 네비게이션 아이템 - 검색 페이지 버튼
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(
                            destination: SearchView(text: "", search:false,test: $test),
                            label: {
                                Label("Search", systemImage: "magnifyingglass").foregroundColor(.white)
                            })
                    }
                    // 네비게이션 아이템 - 새로운 글 작성 버튼
                    ToolbarItemGroup {
                        NavigationLink(
                            destination: PostCreateView(star: 0, user_info: $user_info, Create_view: $Create_view),isActive: $Create_view,
                            label: {
                                Label("create", systemImage: "pencil").foregroundColor(.white).onAppear(){
                                    print("appear count : \(usser.count)")
                                    print("user_info 출력1 : \(user_info)")
                                    if usser.count != 0 {
                                        user_info[0] = usser[0].user_id!
                                        user_info[1] = usser[0].access_token!
                                        print("user_info 출력2 : \(user_info)")
                                        list_upload = get_PostList(access_token: user_info[1], times: 0 )
                                        if list_upload {
                                            postlist = PostList
                                        }
                                        
                                    }
                                    
                                }
                            })
                    }
                }
            }.environment(\.colorScheme, .dark)
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView( coreDM: .constant(CoreDataManager()))
    }
}
