//
//  SearchView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/20.
//

import SwiftUI

struct SearchView: View {
    @State var text: String
    @State var search: Bool
    @Binding var test : String
    var body: some View {
        
            VStack {
                HStack {
                    Spacer()
                    TextField("Search", text: $text)
                        .foregroundColor(.black).frame( height: 40)
                    Button{
                        search = true
                     
                    }label: {
                        Image(systemName: "magnifyingglass")
                    }
                    
                    Spacer()
                }.background(Color.white).cornerRadius(8).padding()
                List(PostList.filter { ($text.wrappedValue.isEmpty || $0.title.contains($text.wrappedValue))}){ post in
                            PostCell(post: post)
                    }

        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: "", search: false,test: .constant(""))
    }
}
