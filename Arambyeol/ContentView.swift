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
   
    // 로그인 유저 정보 저장 CoreData
   
    @State var MENU_LIST : [menu_day] = MENULIST
   
    var body: some View {
        TabView{
            MainSwiftUIView(MENULIST : $MENU_LIST).tabItem {
                Image(systemName: "house")
                Text("Main")
            }.onAppear(){
                loadData()
            }
//            PostView().tabItem {
//                Image(systemName: "house")
//                Text("Main")
//            }
//            MypageView().tabItem {
//                Image(systemName: "house")
//                Text("Main")
//            }
        }
    }
    private func addItem_Menutable(mt_id:String,day: String,meal_time : String , course : String) {
        withAnimation {
            let newtable = Menu_table(context: viewContext)
            newtable.mt_id = mt_id
            newtable.day = day
            newtable.meal_time = meal_time
            newtable.course = course
            

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func loadData(){
        addItem_Menutable(mt_id: "MMA", day: "Mon", meal_time: "", course: "A/한식")
//        for Menu in MENULIST{
//            for mini in Menu.morning{
//                for info in mini.courseList{
//                    print("\(info.course): \(info.menu_name)")
//                }
//
//            }
//            print("------------------")
//            for mini in Menu.lunch{
//                for info in mini.courseList{
//                    print("\(info.course): \(info.menu_name)")
//                }
//
//            }
//            print("------------------")
//            for mini in Menu.dinner{
//                for info in mini.courseList{
//                    print("\(info.course): \(info.menu_name)")
//                }
//
//            }
//            print("==============================")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
