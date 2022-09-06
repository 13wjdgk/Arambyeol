//
//  LoginModalView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI
import CoreData

struct LoginModalView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Binding var coreDM : CoreDataManager
    @Binding var login_Btn : Bool
    @State var login_ID = ""
    @State var login_PW = ""
    @Binding var login_state : Int
    //로그인 성공시 받아올 토큰 [access_token , refresh_token ,nickname]
    @State var token = ["","",""]
    
  
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                
                Text("로그인")
                //로그인 과정 2. id랑 pw 입력
                HStack{
                    Text(" ID |")
                    TextField("",text: $login_ID).frame(width: 250,height: 25).overlay(VStack{Divider().offset(x: 0, y: 15)}).padding()
                }
                HStack{
                    Text("PW |")
                    TextField("",text: $login_PW).frame(width: 250,height: 25).overlay(VStack{Divider().offset(x: 0, y: 15)}).padding()
                }
                Button{

                    // 로그인 기능 3. login API 호출
                    // login_state = -1 : 로그인 시도 전, 0 : 로그인 실패 , 1 : 로그인 성공
                    login_state = login(login: Login(user_id: login_ID, user_pw: login_PW ), token: &token)
                    
                    //API에서 로그인이 성공되면
                   if(login_state == 1 ){
                       print("로그인 결과 :  성공 : \(login_ID),\(token[0]),\(token[2])")
                       
                       // 로그인 기능 4. CoreData User에 login 정보 추가
                       coreDM.add_user(user_id: login_ID, access_token: token[0], refresh_token: token[1], nickname: token[2], content: managedObjContext)
                       // 로그인 기능 5. login_Btn = false로 해서 로그인 모달 창 닫기
                       login_Btn = false
                    }else {
                       print("로그인 실패")
                    }
                    
                }label: {
                    Text("확인")
                }
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
        LoginModalView( coreDM:.constant(CoreDataManager()) , login_Btn: .constant(true) , login_state : .constant(-1))
    }
}
