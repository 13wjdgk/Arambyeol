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
    @State var user_info : User = user
    @State var login_Btn = false
    @State var signup_Btn = false
    @State var login_ID = ""
    @State var login_PW = ""
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
//                                Button{}label: {
//                                    Text("내 정보 수정").foregroundColor(.white)
//                                }
//                                Text("|")
                                Button{
                                    login_Btn = true
                                   
                                }label: {
                                    Text("로그인").foregroundColor(.white)
                                }.sheet(isPresented: $login_Btn) {
                                    
                                    LoginModalView(userinfo :$user_info, login_Btn: $login_Btn)

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
                            }
                        Spacer()
                    }.padding()
                
            
            .navigationTitle("마이페이지").navigationBarTitleDisplayMode(.inline)
        }.environment(\.colorScheme, .dark)
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
