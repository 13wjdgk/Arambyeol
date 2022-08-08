//
//  MainSwiftUIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/28.
//

import SwiftUI

struct CustomGroupBoxStyle : GroupBoxStyle{
    var background: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.yellow,lineWidth: 2)
            

        }
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            configuration.label
            configuration.content

        }
        .padding().frame(width:300).background(background)

    }
}
struct MainSwiftUIView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("아람별행성").resizable().frame(width: 112, height: 107).padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                    Text("오늘의 아침").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
                    GroupBox() {
                        Group{
                            Text("A코스 / 한식").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                            Text("부대덮밥").foregroundColor(.white).font(.system(size: 14))
                            Text("우동국").foregroundColor(.white).font(.system(size: 14))
                            Text("부들어묵볶음").foregroundColor(.white).font(.system(size: 14))
                            Text("치커리오리엔탈소스무침").foregroundColor(.white).font(.system(size: 14))
                            Text("배추김치").foregroundColor(.white).font(.system(size: 14))
                            Text("망고주스").foregroundColor(.white).font(.system(size: 14))
                        }
                        
                        Group{
                            Text("B코스 / 일품").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                            Text("김치말이국수").foregroundColor(.white).font(.system(size: 14))
                            Text("오징어야채핫바").foregroundColor(.white).font(.system(size: 14))
                            Text("단무지").foregroundColor(.white).font(.system(size: 14))
                            Text("배추김치").foregroundColor(.white).font(.system(size: 14))
                            Text("망고주스").foregroundColor(.white).font(.system(size: 14))
                        }
                        
                        Group{
                            Text("c코스 / 일품").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                            Text("김치말이국수").foregroundColor(.white).font(.system(size: 14))
                            Text("오징어야채핫바").foregroundColor(.white).font(.system(size: 14))
                            Text("단무지").foregroundColor(.white).font(.system(size: 14))
                            Text("배추김치").foregroundColor(.white).font(.system(size: 14))
                            Text("망고주스").foregroundColor(.white).font(.system(size: 14))
                        }
                        Group{
                            Text("테이크아웃").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                            Text("초코소라빵").foregroundColor(.white).font(.system(size: 14))
                            Text("음료").foregroundColor(.white).font(.system(size: 14))
                            Text("콘시리얼바").foregroundColor(.white).font(.system(size: 14))
                        }
                        
                    }.groupBoxStyle(CustomGroupBoxStyle())
                   
            }

        }
            
        
    }
}


struct MainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainSwiftUIView()
    }
}
}
