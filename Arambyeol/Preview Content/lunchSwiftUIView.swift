//
//  lunchSwiftUIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//






import SwiftUI

struct lunchSwiftUIView: View {
    var body: some View {
        ZStack{
//            Color.clear.edgesIgnoringSafeArea(.all)
            VStack {
                Text("오늘의 점심").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
                GroupBox() {
                    Group{
                        Text("A코스 / 한식").foregroundColor(.yellow).fontWeight(.semibold).font(.system(size: 16)).padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                        Text("김치가츠나베").foregroundColor(.white).font(.system(size: 14))
                        Text("우동국").foregroundColor(.white).font(.system(size: 14))
                        Text("치킨").foregroundColor(.white).font(.system(size: 14))
                        Text("흑임자샐러드").foregroundColor(.white).font(.system(size: 14))
                        Text("배추김치").foregroundColor(.white).font(.system(size: 14))
                        Text("아이스티").foregroundColor(.white).font(.system(size: 14))
                    }


                }.groupBoxStyle(CustomGroupBoxStyle())
            }

        
        }


        }
    }





struct lunchSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSwiftUIView()
    }
}

