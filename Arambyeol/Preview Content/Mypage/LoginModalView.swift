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
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.user_id , order: .reverse)]) var usser : FetchedResults<User>
//    var usser : FetchedResults<User>.Element
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.user_id , order: .reverse)]) var usser : FetchedResults<User>
    @Binding var coreDM : CoreDataManager
    @Binding var user : User
    @Binding var login_Btn : Bool
    @State var login_ID = ""
    @State var login_PW = ""
    @Binding var login_state : Int
    //로그인 성공시 받아올 토큰 [access_token , refresh_token ,nickname]
    @State var token = ["","",""]
    
    
    func updateUser(user : inout User , coreDM : CoreDataManager){
        let new_user = coreDM.get_user()
        user.user_id = new_user.user_id
        user.nickname = new_user.nickname
        user.access_token = new_user.access_token
        user.refresh_token = new_user.refresh_token
    }
    
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
                Button{
//                    print("로그인 전 : \(usser.count)")
                    // 로그인 기능 3. login API 호출
                    login_state = login(login: Login(user_id: login_ID, user_pw: login_PW ), token: &token)
                    
                    //API에서 로그인이 성공되면
                   if(login_state == 1 ){
                       print("로그인 결과 :  성공 : \(login_ID),\(token[0]),\(token[2])")
                       // 로그인 기능 4. CoreData User[0]에 login 정보 추가
//                       coreDM.edit_user(user: user, user_id: login_ID, access_token: token[0], refresh_token: token[1], nickname: token[2], content: managedObjContext)
                       
                       
                       coreDM.add_user(user_id: login_ID, access_token: token[0], refresh_token: token[1], nickname: token[2], content: managedObjContext)
//                       print("로그인 후 : \(usser.count)")
                       
                       
//                       coreDM.login_user(user_id: login_ID, access_token: token[0], refresh_token: token[1], nickname: token[2])
                       
                       
                       
                       // 로그인 기능 5. swiftui user 변수에 로그인 정보 업데이트
//                       print("why error? : \(coreDM.fetchUsers()[0].nickname)")
                       //coreData 값을 swiftui 변수에 옮김
//                       updateUser(user: &user, coreDM: coreDM)
//                       print("로그인 결과 성공 : \(user.user_id),\(user.access_token),\(user.nickname)")
//                       user = coreDM.login_user( user_id: login_ID ?? "", access_token: token[0] ?? "", refresh_token: token[1] ?? "",nickname: token[2] ?? "")
//                      print("user.user_id는 : \(user.user_id)")
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
        LoginModalView( coreDM:.constant(CoreDataManager()), user:  .constant(User()), login_Btn: .constant(true) , login_state : .constant(-1))
    }
}
