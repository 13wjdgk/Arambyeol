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
    @State var signup_info = ["","","",""]

    
    
    //user 업데이트 확인용
//    func updateUser(user : User , coreDM : CoreDataManager , usser : FetchedResults<User>){
//        print("useer : \(usser.count)")
//        print("useer[0] : \(usser[0].user_id)")
//        print("countt : \(coreDM.fetchUsers().count)")
//
//    }
   
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

                                        login_Btn = true
                                        
                                    }label: {
                                    
                                        Text("로그인").foregroundColor(.white)
                                    }.sheet(isPresented: $login_Btn) {
                                        //로그인 과정 1. 로그인 버튼 누르면 LoginModalView로 이동
                                        LoginModalView( coreDM: $coreDM,  login_Btn: $login_Btn , login_state : $login_state)

                                    }
                                    
                                }else { //로그아웃 버튼
                                    
                                    Button{
                                        //로그아웃 과정 1. login_state = 0으로 변경해서 로그아웃 됨을 알림 -> UI변경
                                        login_state = 0
                                        print("로그아웃 전 : \(usser)")
                                        print("로그아웃 전 count : \(usser.count)")
                                        do{
//
//                                             로그아웃 과정 2. 로그인 user 데이터 삭제 (CoreData User)
                                            coreDM.delete_user( content: managedObjContext)
                                        }catch{
                                            print("로그아웃 실패")
                                        }
                                        print("로그아웃 후 : \(usser.count)")
                                            print("로그아웃 완료 !!!")

                                        print("로그아웃 : \(usser)")
                                       
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
                                        SignUpView( coreDM: $coreDM, goView: $goView , login_state : $login_state, token: $signup_info ).onDisappear(){
                                            print("닫힘=======================================================")
                                            print("닫히고 user 정보 : \(usser.count)")
                                            if(login_state == 1 ){
                                                print("회원가입 데이터 삭제 전 : \(usser.count)")
//                                                coreDM.delete_user( content: managedObjContext)
                                                print("회원가입 데이터 삭제 후 : \(usser.count)")
//
//                                                회원가입 과정 7-1. CoreData User에 login 정보 추가
                                                coreDM.add_user(user_id: signup_info[0], access_token: signup_info[1], refresh_token: signup_info[2], nickname: signup_info[3], content: managedObjContext)
                                                print("회원가입 데이터 추가 후 : \(usser.count)")
                                         }
                                            
                                        }
                                       
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
