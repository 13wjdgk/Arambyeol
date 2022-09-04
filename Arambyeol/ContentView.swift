//
//  ContentView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
////    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var User : FetchedResults<User>
    
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
            MypageView(coreDM: CoreDataManager(), user_info: Users()).tabItem {
                Image(systemName: "house")
                Text("Main")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
