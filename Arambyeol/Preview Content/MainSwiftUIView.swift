////
////  MainSwiftUIView.swift
////  Arambyeol
////
////  Created by 김가은 on 2022/07/28.
////
//
import SwiftUI

struct MainSwiftUIView: View {
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack{
                    Image("아람별행성").resizable().frame(width: 112, height: 107)
                        TabView{
                            dinnerSwiftUIView()
                            lunchSwiftUIView()
                            dinnerSwiftUIView()
                        }.tabViewStyle(PageTabViewStyle()).frame(width: 350, height: 670)
                    Spacer()
                    TabView{
                        lunchSwiftUIView()
                        lunchSwiftUIView()
                        dinnerSwiftUIView()
                    }.tabViewStyle(PageTabViewStyle()).frame(width: 350,height: 670)
                    Spacer()
                    TabView{
                        lunchSwiftUIView()
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
        MainSwiftUIView()
    }
}

