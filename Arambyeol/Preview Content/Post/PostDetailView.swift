//
//  PostDetailView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/24.
//

import SwiftUI

struct TextView: UIViewRepresentable {
 
    @Binding var text: String
//    @Binding var textStyle: UIFont.TextStyle
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
//        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
       
        textView.isSelectable = false
        textView.isUserInteractionEnabled = true
 
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
//        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
    

}

struct PostDetailView: View {
    var post : Post
    @State var content =  "오늘 아람이 메뉴 양꼬치 나왔는데 진짜 너무 맛있더라,,"
    @State var like_b = Color.white
    let access_token : String
    //string 이미지 -> UIImage로 변환
    func makeUIImage(base64 : String)->UIImage{
        guard let base64String = URL(string: base64) else { return UIImage() }
        
//        let base64String = sourceData.base64EncodedString()

        /// Convert base64-encoded String to UIImage
        guard let sourceData = try? Data(contentsOf: base64String),
              let uiImage = UIImage(data: sourceData) else {
                  print("Error: couldn't create UIImage")
                  return UIImage()
              }
        return uiImage
    }
    var body: some View {
        GroupBox{
            VStack(alignment: .leading){
                
                Text(post.title).font(.system(size: 20)).fontWeight(.semibold)
                HStack{
                    Text(post.nickname).font(.system(size: 12))
                    Text("|").font(.system(size: 12))
                    Text(post.meal_time).font(.system(size: 12))
                    Text("|").font(.system(size: 12))
                    ForEach(0..<post.score) { num in
                        Image("노란별").resizable().frame(width: 15, height: 15)
                                }
                    ForEach(0..<5-post.score) { num in
                        Image("회색별").resizable().frame(width: 15, height: 15)
                                }
                   
                    
                    
                }
                Divider()
//                Text(post.content).padding()
                HStack{
                    Spacer()
                    if post.image != UIImage() {
                        Image(uiImage: post.image)
//                        if let data = Data(base64Encoded: post.image), let uiImage = UIImage(data: data) {
//                            Image(uiImage: uiImage)
//                        } else {
//                            Text(post.image)
//                        }
////                        Image(uiImage: makeUIImage(base64 : post.image ))
                    }
                    
                    Spacer()
                }
                HStack{
                    Button{
                        if like_b == Color.blue {
                            like_b = Color.white
                        }else{
                            like_b = Color.blue
                            like_post(post_id: post.post_id, access_token: access_token, status: "plus")
                        }
                        
                    }label: {
                        Image(systemName: "hand.thumbsup.fill").padding().foregroundColor(like_b)
                    }
//                    Text(String(post.like))
                    Button{
//                        deletePost()
                    }label: {
                        Image(systemName: "trash.fill").padding().foregroundColor(.black)
                    }
                    
                }
                
               Spacer()
            }
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post(image: UIImage(), meal_time: "", post_id: 8, score: 0, title: "", nickname: ""), access_token: "")
    }
}
