//
//  breakfastView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct breakfastView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Menu_table.mt_id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Menu_table>
    @Binding  var morning : [menu_course]
    @State var height_size : CGFloat = 200
    var body: some View {
        VStack{
            
           
            Text("# 아침").onAppear(){
                for item in items {
                    print("Coredata : \(item.mt_id)")
                }
            }
            Spacer().frame( height: 20)
           ScrollView(){
                
                VStack {
                    
                    ForEach(items){  menu in
                        Text( menu.mt_id!).foregroundColor(.black).font(.system(size: 14))
//                        Text("\(menu_course.courseList[0].course)").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
//                        ForEach(menu_course.courseList){ menu in
//                            Text("\(menu.menu_name)").foregroundColor(.black).font(.system(size: 14))
//                        }
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


        }
    }





struct breakfastView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUIView()
    }
}

