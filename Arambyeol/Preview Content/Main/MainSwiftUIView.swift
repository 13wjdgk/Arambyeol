////
////  MainSwiftUIView.swift
////  Arambyeol
////
////  Created by 김가은 on 2022/07/28.
////
//
import SwiftUI

struct MainSwiftUIView: View {
    @Binding var MENULIST : [menu_day]
    var body: some View {
        

//
        ScrollView {
            VStack{
                Spacer()
                Image("아람별행성").resizable().frame(width: 112, height: 107)
                Spacer()
                Group{
                    Text("오늘의 아람").foregroundColor(.white).frame(width: 150,height: 30).background(RoundedRectangle(cornerRadius: 20).fill(Color.init( red: 1, green: 0.76, blue: 0.42)))
                    breakfastView(morning: $MENULIST[0].morning)
                    Spacer().frame(height:50)
                    lunchSwiftUIView(lunch: $MENULIST[0].lunch)
                    Spacer().frame(height:50)
                    dinnerSwiftUIView(dinner: $MENULIST[0].dinner)
                    Spacer().frame(height:50)
                }
                Divider()
                Spacer().frame(height:50)
                Group{
                    Text("내일의 아람").foregroundColor(.white).frame(width: 150,height: 30).background(RoundedRectangle(cornerRadius: 20).fill(Color.init( red: 1, green: 0.76, blue: 0.42)))
                    breakfastView(morning: $MENULIST[1].morning)
                    Spacer().frame(height:50)
                    lunchSwiftUIView(lunch: $MENULIST[1].lunch)
                    Spacer().frame(height:50)
                    dinnerSwiftUIView(dinner: $MENULIST[1].dinner)
                    Spacer().frame(height:50)
                }
                Divider()
                Spacer().frame(height:50)
                Group{
                    Text("모레의 아람").foregroundColor(.white).frame(width: 150,height: 30).background(RoundedRectangle(cornerRadius: 20).fill(Color.init( red: 1, green: 0.76, blue: 0.42)))
                    breakfastView(morning: $MENULIST[2].morning)
                    Spacer().frame(height:50)
                    lunchSwiftUIView(lunch: $MENULIST[2].lunch)
                    Spacer().frame(height:50)
                    dinnerSwiftUIView(dinner: $MENULIST[2].dinner)
                    Spacer().frame(height:50)
                }
                  
            }
        }
    }
    
}
struct MainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainSwiftUIView(MENULIST: .constant([]))
    }
}

