//
//  ContentView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
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
            MypageView().tabItem {
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
