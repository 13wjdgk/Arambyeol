//
//  ContentView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
    //user CoreData controller
    @State var coreDM : CoreDataManager = CoreDataManager()
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.user_id , order: .reverse)]) var usser : FetchedResults<User>
    // 로그인 유저 정보 저장 CoreData
    @State var user : User
//    
    var body: some View {
        TabView{
            MainSwiftUIView().tabItem {
                Image(systemName: "house")
                Text("Main")
            }
            PostView().tabItem {
                Image(systemName: "house")
                Text("Main")
            }
            MypageView(  coreDM: $coreDM , user: $user ).tabItem {
                Image(systemName: "house")
                Text("Main")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( user: User())
    }
}
