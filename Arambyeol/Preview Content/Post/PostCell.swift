//
//  PostCell.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//

import SwiftUI

struct PostCell: View {
    var post : Post
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                
                Text(post.title).font(.system(size: 15))
                HStack{

                    ForEach(0..<post.score) { num in
                        Image("노란별").resizable().frame(width: 15, height: 15)
                                }
                    ForEach(0..<5-post.score) { num in
                        Image("회색별").resizable().frame(width: 15, height: 15)
                                }
                    Spacer()
                    Text(post.nickname).font(.system(size: 12))
                }
        }
        }.padding()
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(image : UIImage(), meal_time : "", post_id : 9, score : 0, title : "", nickname : ""))
    }
}
