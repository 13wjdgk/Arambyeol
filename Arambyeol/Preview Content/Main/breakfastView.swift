//
//  breakfastView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct breakfastView: View {
   
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Menu_table.mt_id, ascending: true)],
        animation: .default)
    private var tables: FetchedResults<Menu_table>
    
    
    
    @Environment(\.managedObjectContext) private var viewContext
    var day = ["월","화","수","목","금","토","일"]
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Menu_Info.mt_id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Menu_Info>
    @State private var filterScope: FilterScope = FilterScope(filter: "월M")
    @Binding var searchKey : String
    @State var menuCourse : [menu_course] = []
//    var menuinfo_course : [menu_info] = []
    @Binding  var morning : [menu_course]
    @State var height_size : CGFloat = 200
    var body: some View {
        VStack{
            Text("# 아침").onAppear(){
                deleteAll()
                loadData()
                print("아침 APPear")
                print(searchKey)
            }
            Spacer().frame( height: 20)
           ScrollView(){
                
                VStack {
                    ForEach(menuCourse ){  course in
                        Text("\(course.courseList[0].course)")
                        ForEach(course.courseList){ item in
                            Text("\(item.menu_name)").foregroundColor(.black).font(.system(size: 14))
                        }
                        
                        
                        }
                    }
                }
           }.onAppear(){
               if morning.count > 1 {
                   height_size = 400
               }else{
                   height_size = 200
               }
           }.frame(width: 200, height: height_size).padding().background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .init( red: 1, green: 0.76, blue: 0.42, opacity: 0.6), radius: 10,  x: 0, y: 0))
           
        
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
    private func addItem_Menuinfo(menu_id : Int,mt_id : String,course : String,menu_name : String,score : Float) {
        withAnimation {
            let newmenu = Menu_Info(context: viewContext)
            newmenu.menu_id = Int32(menu_id)
            newmenu.course = course
            newmenu.menu_name = menu_name
            newmenu.score = score
            newmenu.mt_id = mt_id
            
            

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
    
    
    
    private func deleteAll(){
        for menu in items {
            viewContext.delete(menu)
        }
        try? viewContext.save()
    }
    //coredata에 저장하는 함수
func loadData(){
        print( MENULIST)
        for (ind , Menu) in MENULIST.enumerated(){
            for (cou , mini) in Menu.morning.enumerated(){
//                print("cours : \(mini.courseList.count)")
                addItem_Menutable(mt_id: "\(day[ind])M", day:day[ind] , meal_time: "아침", course: mini.courseList[0].course)
                for info in mini.courseList{
                    addItem_Menuinfo(menu_id: info.menu_id, mt_id: "\(day[ind])M", course: info.course, menu_name: info.menu_name, score: info.score)
                }

            }
            print("------------------")
            for (cou , mini) in Menu.lunch.enumerated(){
//                print("cours : \(mini.courseList.count)")
                addItem_Menutable(mt_id: "\(day[ind])L", day:day[ind] , meal_time: "점심", course: mini.courseList[0].course)
                for info in mini.courseList{
                    addItem_Menuinfo(menu_id: info.menu_id, mt_id: "\(day[ind])L", course: info.course, menu_name: info.menu_name, score: info.score)
                }

            }
            print("------------------")
            for (cou , mini) in Menu.dinner.enumerated(){
//                print("cours : \(mini.courseList[0].course)")
                addItem_Menutable(mt_id: "\(day[ind])D", day:day[ind] , meal_time: "저녁", course: mini.courseList[0].course)
                for info in mini.courseList{
                    addItem_Menuinfo(menu_id: info.menu_id, mt_id: "\(day[ind])D", course: info.course, menu_name: info.menu_name, score: info.score)
                }

            }
            print("==============================")
//            searchKey = "월L"
//            filterScope = FilterScope(filter : searchKey)
            
            print("==============================")
        }
    items.nsPredicate = filterScope.predicate
    var course = items[0].course ?? ""
    var newMenuCourse =  menu_course()
    
    for m in items {
        //코스끼리 모아서 리스트에 저장
        if m.course == course {
            newMenuCourse.courseList.append(menu_info(menu_id: Int(m.menu_id), menu_name : m.menu_name!, score: m.score, course: m.course!))
        }else{
            menuCourse.append(newMenuCourse)
            course = m.course ?? ""
            newMenuCourse = menu_course()
            newMenuCourse.courseList.append(menu_info(menu_id: Int(m.menu_id), menu_name: m.menu_name!, score: m.score, course: m.course!))
        }
    }
    }

        
    }





struct breakfastView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUIView()
    }
}

