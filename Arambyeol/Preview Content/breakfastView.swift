//
//  breakfastView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI

struct breakfastView: View {
    var body: some View {
        List(0 ..< 12) { item in
            Text("아침").foregroundColor(.black)
        }.listStyle(.inset)
//        Text("A코스 / 한식").foregroundColor(.black)
//        Text("부대덮밥").foregroundColor(.black)
//        Text("우동국").foregroundColor(.black)
//        Text("부들어묵볶음").foregroundColor(.black)
//        Text("치커리오리엔탈소스무침").foregroundColor(.black)
//        Text("배추김치").foregroundColor(.black)
//        Text("망고주스").foregroundColor(.black)
//        Text("B코스 / 일품").foregroundColor(.black)
//        Text("김치말이국수").foregroundColor(.black)
        
    }
}

struct breakfastView_Previews: PreviewProvider {
    static var previews: some View {
        breakfastView()
    }
}
