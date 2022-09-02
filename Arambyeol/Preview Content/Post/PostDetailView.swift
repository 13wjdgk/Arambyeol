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
    @State var content =  "오늘 아람이 메뉴 양꼬치 나왔는데 진짜 너무 맛있더라,,"
    var body: some View {
        GroupBox{
            VStack(alignment: .leading){
                
                Text("오늘 아람 맛있다 ~").font(.system(size: 20)).fontWeight(.semibold)
                HStack{
                    Text("파란코끼리").font(.system(size: 12))
                    Text("|").font(.system(size: 12))
                    Text("점심").font(.system(size: 12))
                    Text("|").font(.system(size: 12))
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("노란별").resizable().frame(width: 15, height: 15)
                    Image("회색별").resizable().frame(width: 15, height: 15)
                }
                Divider()
                Text(content).padding()
                HStack{
                    Spacer()
                    Image("머리").resizable().frame(width: 280, height: 280,alignment: .center)
                    Spacer()
                }
                HStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "hand.thumbsup.fill").padding().foregroundColor(.black)
                    }
                    
                    Text("16")
                }
                
               Spacer()
            }
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
