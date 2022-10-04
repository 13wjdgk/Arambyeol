//
//  dinnerSwiftUIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//
import SwiftUI

struct dinnerSwiftUIView: View {
  
    var body: some View {
        ZStack{
//            Color.clear.edgesIgnoringSafeArea(.all)
            VStack {
                Text("오늘의 저녁").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
                GroupBox() {
                    Group{
                        Text("쌀밥 / 흰밥").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
//                        ForEach(menu_day, id: \.name) { menu in
//                            Text(menu.menu_name).foregroundColor(.white).font(.system(size: 14))
//                        }
                        
//                        if Menu_list.count != 0 {
//                            Text("\(Menu_list[0].morning[0].menu_name)").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
//                        }else{
//
//                        }
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





struct dinnerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUIView()
    }
}

