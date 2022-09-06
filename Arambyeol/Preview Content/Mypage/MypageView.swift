//
//  MypageView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI



struct ProfileGroupBoxStyle : GroupBoxStyle{
    var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray,lineWidth: 1)
        }
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            configuration.label
            configuration.content
        }
        .padding().frame(width:350,height: 90).background(background)

    }
}

struct MypageGroupBoxStyle : GroupBoxStyle{
    var background: some View {
        RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height:600)
        }
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            configuration.label
            configuration.content
        }
        .background(background)
    }
}
struct MypageView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.user_id , order: .reverse)]) var usser : FetchedResults<User>
    @Binding var coreDM : CoreDataManager
    @State var goView = false
    @Binding var user : User
    @State var login_Btn = false
    @State var signup_Btn = false
    @State var login_ID = ""
    @State var login_PW = ""
    @State var login_state = -1
    func updateUser(user : User , coreDM : CoreDataManager , usser : FetchedResults<User>){
        print("useer : \(usser.count)")
        print("useer[0] : \(usser[0].user_id)")
//        print("useer[1] : \(usser[1].user_id)")
        print("countt : \(coreDM.fetchUsers().count)")
//        let new_user = coreDM.fetchUsers()[0]
//        print("plzzz : \(new_user.user_id)")

//        user.user_id = new_user.user_id
//        user.nickname = new_user.nickname
//        user.access_token = new_user.access_token
//        user.refresh_token = new_user.refresh_token
    }
   

//    CoreDataManager().persistentContainer.viewContext.fetch(User.fetchRequest())
    var body: some View {
        NavigationView {
                    GroupBox("") {
                    Spacer()
                        VStack {
                            GroupBox(""){
                                HStack{
                                    Image("머리").resizable().frame(width: 60, height: 60).padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 40))
                                    if login_state == 1 {
                                        VStack(alignment: .leading) {
                                            Text(usser[0].nickname!).fontWeight(.bold)
                                            Text(usser[0].user_id!)
                                        }
                                    }else{
                                        Text("로그인해 주세요")
                                    }
                                    
                                    Spacer()
                                }
                            }.groupBoxStyle(ProfileGroupBoxStyle())
                            HStack{
                                Spacer()

                                //로그인 버튼
                                if login_state != 1 {
                                    
                                    Button{
//                                         로그인 기능 1. 전체 User CoreData를 삭제한다.
//                                        coreDM.deleteAllUser()
//                                        // 로그인 기능 2. user 초기화
//                                        user = coreDM.login_user(user_id: "", access_token: "", refresh_token: "", nickname: "")
//                                        print("초기화 후 : \(user)")
//                                        CoreDataManager.shared.add_user(user_id: "", access_token: "", refresh_token: "", nickname: "", content: managedObjContext)
//                                        CoreDataManager.shared.save(content: managedObjContext)
//
//                                        print("0 아니라고1 : \(usser.count)")
//                                        print("0 아니라고2 : \( CoreDataManager.shared.fetchUsers().count)")
                                        login_Btn = true
                                        
                                    }label: {
                                        Text("로그인").foregroundColor(.white)
                                    }.sheet(isPresented: $login_Btn) {
                                        // 로그인 기능 2. LoginModal 페이지로 이동한다.
                                        LoginModalView( coreDM: $coreDM, user
                                                       : $user, login_Btn: $login_Btn , login_state : $login_state).onDisappear(){
                                            updateUser(user: user, coreDM: coreDM, usser: usser)

                                        }

                                    }
                                    
                                }else { //로그인 안되어있을 경우 로그인 버튼
                                    
                                    Button{
                                        
                                        login_state = 0
                                        print("로그아웃 전 : \(usser)")
                                        print("로그아웃 전 count : \(usser.count)")
                                        do{
//                                            coreDM.deleteAllUser(content: managedObjContext)
                                            coreDM.add_user(user_id: "5test", access_token: "5test", refresh_token: "5test", nickname: "5test", content: managedObjContext)
                                            coreDM.delete_user(user: usser[0], content: managedObjContext)
                                        }catch{
                                            print("로그아웃 실패")
                                        }
                                        print("로그아웃 후 : \(usser.count)")
                                            print("로그아웃 완료 !!!")
                                        
                                       
                                        
                                        print("로그아웃 : \(usser)")
                                        //CoreData user 정보 없애기 API 호출
                                    }label: {
                                        Text("로그아웃").foregroundColor(.white)
                                        
                                    }
                                }
                                
                                Text("|")
                                if login_state == 1 {
                                    
                                    NavigationLink(isActive : $goView){
                                        EditInfoIView(goView: $goView, user: $user)
                                    }label: {
                                        Text("내 정보 수정").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).onTapGesture {
                                            goView = true
                                        }
                                    }
                                    
                                }else {
                                    
                                    NavigationLink(isActive: $goView ){
                                        SignUpView( goView: $goView)
                                    }label: {
                                        Text("회원가입").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).onTapGesture {
                                            goView = true
                                        }
                                    }
                                    
                                }

                               
                            }
                            Spacer().frame( height: 40)
                            List{
                                NavigationLink{
                                    MyPostListView()
                                }label: {
                                    Text("내가 쓴 글")
                                }.listRowBackground(Color.clear)
                                
                                    Text("다크모드").listRowBackground(Color.clear)
                                
                                
                            }.listStyle(.plain).background(.clear)
                            

                            }
                        Spacer()
                    }.padding()
                
            
            .navigationTitle("마이페이지").navigationBarTitleDisplayMode(.inline)
        }.environment(\.colorScheme, .dark)
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView( coreDM :.constant(CoreDataManager()) ,user: .constant(User()))
    }
}
