//
//  MypageView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI
class Theme {
    static func navigationBarColors(background : UIColor?,
       titleColor : UIColor? = nil, tintColor : UIColor? = nil ){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background ?? .clear
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
       
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
    }
}

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
    var body: some View {
        NavigationView {
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                    GroupBox() {
                        VStack {
                            GroupBox(""){
                                HStack{
                                    Image("머리").resizable().frame(width: 60, height: 60).padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 40))
                                    VStack(alignment: .leading) {
                                        Text("파란꼬끼리").fontWeight(.bold).foregroundColor(.black)
                                        Text("fodsnf@gnu.ac.kr").foregroundColor(.black)
                                    }
                                    Spacer()
                                }
                            }.groupBoxStyle(ProfileGroupBoxStyle())
                            HStack{
                                Button{}label: {
                                    Text("내 정보 수정")
                                }
                                Text("|")
                                Button{}label: {
                                    Text("로그인")
                                }
                            }
                            List{
                                Text("내가 쓴 글").listRowBackground(Color.white).foregroundColor(.black)
                                Text("내가 쓴 댓글").listRowBackground(Color.white).foregroundColor(.black)
                                Text("다크모드").listRowBackground(Color.white).foregroundColor(.black)
                            }.listStyle(.plain).frame( height: 150).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                            }
                    }.groupBoxStyle(MypageGroupBoxStyle())
            }
            .navigationTitle("마이페이지").navigationBarTitleDisplayMode(.inline).foregroundColor(.black)
        }.environment(\.colorScheme, .dark)
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
