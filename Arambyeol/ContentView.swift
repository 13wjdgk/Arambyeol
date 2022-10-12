//
//  ContentView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
    //user CoreData controller
    @Environment(\.managedObjectContext)  var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Menu_table.mt_id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Menu_table>
    var day = ["월","화","수","목","금","토","일"]
    // 로그인 유저 정보 저장 CoreData
   
    @State var MENU_LIST : [menu_day] = MENULIST
   
    var body: some View {
        VStack{
       
            MainSwiftUIView(MENULIST : $MENU_LIST)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
