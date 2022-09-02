//
//  SignUpView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI


struct SignUpView: View {
    @State var email = ""
    var body: some View {
        NavigationView {
            GroupBox{
                VStack(alignment: .leading){
                    Text("정보입력").fontWeight(.bold)
                    //이메일
                    Group{
                        HStack{
                            Text("이메일 |")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Text("@ gnu.ac.kr")
                            Button{
                                
                            }label: {
                                Text("인증").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            Text("* 경상국립대학교 이메일만 사용가능합니다.").font(.system(size: 11))
                            Spacer()
                            
                        }
                    }
                    
                    //인증번호
                    Group{
                        HStack{
                            Text("인증번호 |")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                
                            }label: {
                                Text("인증").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            Text("인증 실패되었습니다. 다시 시도하십시오").font(.system(size: 11))
                            Spacer()
                            
                        }
                    }
                    
                    //닉네임
                    Group{
                        HStack{
                            Text("닉네임 |")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            Text("* N 글자 이하로 입력해 주세요").font(.system(size: 11))
                            Spacer()
                            
                        }
                        Spacer()
                        
                    }
                    Text("비밀번호 입력").fontWeight(.bold)
                    //비밀번호
                    Group{
                        HStack{
                            Text("비밀번호 |")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            VStack{
                                Text("* 8~ 15 이하로 입력해 주세요.").font(.system(size: 11))
                                Text("  영문자,숫자,특수문자만 가능합니다..").font(.system(size: 11))
                            }

                            Spacer()
                            
                        }
                    }
                    Group{
                        HStack{
                            Text("비밀번호 확인|")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            Text(" 비밀번호가 일치하지 않습니다.").font(.system(size: 11))
                            Spacer()
                            
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Button{}label: {
                            Text("가입하기").frame(width: 80, height: 25, alignment: .center).background(.gray).foregroundColor(.white)
                        }
                        Spacer()
                    }
                   
                    Spacer()
                    
                }
            }.padding()
                .navigationTitle("회원가입").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
