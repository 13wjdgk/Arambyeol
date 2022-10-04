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
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack{
                    Spacer()
                    Image("아람별행성").resizable().frame(width: 112, height: 107)
                        TabView{
                            breakfastView(morning: $MENULIST[0].morning)
                            lunchSwiftUIView()
                            dinnerSwiftUIView()
                        }.tabViewStyle(PageTabViewStyle()).frame(width: 350, height: 670)
                    Spacer()
                    TabView{
                        breakfastView(morning: $MENULIST[0].morning)
                        lunchSwiftUIView()
                        dinnerSwiftUIView()
                    }.tabViewStyle(PageTabViewStyle()).frame(width: 350,height: 670)
                    Spacer()
                    TabView{
                        breakfastView(morning: $MENULIST[0].morning)
                        lunchSwiftUIView()
                        dinnerSwiftUIView()
                    }.tabViewStyle(PageTabViewStyle()).frame(width: 350,height: 670)
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

