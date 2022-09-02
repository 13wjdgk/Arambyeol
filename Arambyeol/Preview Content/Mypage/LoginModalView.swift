//
//  LoginModalView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI

struct LoginModalView: View {
    @State var login_ID = ""
    @State var login_PW = ""
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                
                Text("로그인")
                HStack{
                    Text(" ID |")
                    TextField("",text: $login_ID).frame(width: 250,height: 25).overlay(VStack{Divider().offset(x: 0, y: 15)}).padding()
                }
                HStack{
                    Text("PW |")
                    TextField("",text: $login_PW).frame(width: 250,height: 25).overlay(VStack{Divider().offset(x: 0, y: 15)}).padding()
                }
                Button{}label: {
                    Text("확인")
                }
                Spacer().frame(height:50)
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("회원가입")
                    }.padding()
                }
                
                
            }
            
        }

    }
}

struct LoginModalView_Previews: PreviewProvider {
    static var previews: some View {
        LoginModalView()
    }
}
