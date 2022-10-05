//
//  lunchSwiftUIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//






import SwiftUI

struct lunchSwiftUIView: View {
    @Binding var lunch : [menu_course]
    @State var height_size : CGFloat = 200
    var body: some View {
        VStack{
            
           
            Text("# 점심")
            Spacer().frame( height: 20)
           ScrollView(){
                
                VStack {
                    
                    ForEach(lunch){ menu_course in
                        Text("\(menu_course.courseList[0].course)").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                        ForEach(menu_course.courseList){ menu in
                            Text("\(menu.menu_name)").foregroundColor(.black).font(.system(size: 14))
                        }
                    }
                    
                }

           }.onAppear(){
               if lunch.count > 1 {
                   height_size = 400
               }else{
                   height_size = 200
               }
           }.frame(width: 200, height: height_size).padding().background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .init( red: 1, green: 0.76, blue: 0.42, opacity: 0.6), radius: 10,  x: 0, y: 0))
           
        
        }


        }
    }






struct lunchSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUIView()
    }
}

