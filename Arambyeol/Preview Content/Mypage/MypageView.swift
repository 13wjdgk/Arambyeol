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
    let coreDM : CoreDataManager
    @State var Userr : [User] = [User]()
    @State var user_info : Users
    @State var login_Btn = false
    @State var signup_Btn = false
    @State var login_ID = ""
    @State var login_PW = ""
    private func showUser(){
        Userr = coreDM.get_user()
    }
    var body: some View {
        NavigationView {
                    GroupBox() {
                    Spacer()
                        VStack {
                            GroupBox(""){
                                HStack{
                                    Image("머리").resizable().frame(width: 60, height: 60).padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 40))
                                    if user_info.success {
                                        VStack(alignment: .leading) {
                                            Text(user_info.nickname).fontWeight(.bold)
                                            Text(user_info.user_id)
                                        }
                                    }else{
                                        Text("로그인해 주세요")
                                    }
                                    
                                    Spacer()
                                }
                            }.groupBoxStyle(ProfileGroupBoxStyle())
                            HStack{
                                Spacer()
                                Button{
                                    print("로그인 확인 : ")
                                    showUser()
                                }label: {
                                    Text("확인").foregroundColor(.white)
                                }
                                Text("|")
                                Button{
                                    login_Btn = true
                                    coreDM.login_user(user_id: "13wjdgk", access_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY2MjI3OTY2NywianRpIjoiNDllN2ViMGUtMDBiMS00YjUwLWFhZjctZWViNGJjNmJmM2NhIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjEzd2pkZ2tAZ251LmFjLmtyIiwibmJmIjoxNjYyMjc5NjY3LCJleHAiOjE2NjIzNjYwNjd9.YN0hnfZ6yQ7in_IneKKRUzCMGyM6tBAauLW6v9REYi8", refresh_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY2MjI3OTY2NywianRpIjoiMDg1ZjQ0MWYtYzllNC00OWI5LWI5Y2YtMTI0MTBjNDUzNjM5IiwidHlwZSI6InJlZnJlc2giLCJzdWIiOiIxM3dqZGdrQGdudS5hYy5rciIsIm5iZiI6MTY2MjI3OTY2NywiZXhwIjoxNjYyMzY2MDY3fQ.g3YV0XsWMjceLA0jAEzcjdKIxr_GMuPtidEuMgKB3XI")
                                }label: {
                                    Text("로그인").foregroundColor(.white)
                                }.sheet(isPresented: $login_Btn) {
                                    
//                                    LoginModalView(userinfo :$user_info, login_Btn: $login_Btn)

                                }
                                Text("|")
                                NavigationLink{
                                    SignUpView()
                                }label: {
                                    Text("회원가입").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
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
                            
                            List{
                                ForEach(Userr, id: \.self){ user in
                                    Text(user.user_id ?? "")
                                    
                                }.onDelete { IndexSet in
                                    IndexSet.forEach { index in
                                        let  u = Userr[index]
                                        coreDM.delete_user(user: u)
                                        showUser()
                                    }
                                }
                            }
                            }
                        Spacer()
                    }.padding()
                
            
            .navigationTitle("마이페이지").navigationBarTitleDisplayMode(.inline)
        }.environment(\.colorScheme, .dark)
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView(coreDM :CoreDataManager(), user_info: Users())
    }
}
