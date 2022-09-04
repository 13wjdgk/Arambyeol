//
//  LoginModalView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI
import CoreData

struct LoginModalView: View {
    @Binding var userinfo : Users
    @Binding var login_Btn : Bool
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
//                Button{
//                    login(login: Login(user_id: login_ID, user_pw: login_PW), success: userinfo)
////                    if($userinfo.success){
////                        print("로그인 결과 : \(user.success)")
////                        login_Btn = false
////                        userinfo.user_id = user.user_id
////                        userinfo.access_token = user.access_token
////                        userinfo.refresh_token = user.refresh_token
////                        userinfo.nickname = user.nickname
////                        userinfo.success = true
//
//                    }else {
//                        print("로그인 실패")
//                    }
//                    let user = Arambyeol.User(context : moc)
//                    user.user_id = login_ID
//                    user.refresh_token = "dfjsdlkfwiowe"
//                    user.access_token = "qwefldkjerq98gqgj3q4g"
//                    try? moc.save()
//                }label: {
//                    Text("확인")
//                }
                Spacer().frame(height:50)
                HStack{
                    Spacer()

                }
                
                
            }
            
        }

    }
}

struct LoginModalView_Previews: PreviewProvider {
    static var previews: some View {
        LoginModalView(userinfo:.constant(Users()), login_Btn: .constant(true))
    }
}
