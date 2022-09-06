//
//  SignUpView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/26.
//

import SwiftUI


struct SignUpView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Binding var coreDM : CoreDataManager
    @State var input_Signup = certifiaction_mail(mail: "", number: 0, certification_number: "")
    @Binding var goView : Bool
    @State var result01 = "인증 실패되었습니다. 다시 시도하십시오"
    @State var email = ""
    @State var nickname = ""
    @State var pw = ""
    @State var checkPw = ""
    // [ 인증번호 여부 , 닉네임 중복 여부 , 비밀번호 조건 확인 , 비밀번호 동일 확인]
    @State var result = [false,false,false,false]
    @State var number : String = ""
    @State var signup_result_alert = false
    @State var signup_result = "가입에 실패하였습니다. 양식에 맞춰 다시 가입 부탁드립니다."
    @Binding var login_state : Int
    @Binding var token : [String]
    var body: some View {
        NavigationView {
            GroupBox{
                VStack(alignment: .leading){
                    Text("정보입력").fontWeight(.bold)
                    //이메일
                    Group{
                        HStack{
                            // 학교메일 인증
                            Text("이메일 |")
                            TextField("",text: $email).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Text("@ gnu.ac.kr")
                            Button{
                                //회원가입 과정 1. 인증메일 API 요청
                                SendMail(email: email)
                                input_Signup.mail = email
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
                            TextField("",text: $number).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                
                                input_Signup.number = Int(number) ?? 0
                                //회원가입 과정 1-1. 인증번호 확인 API 요청 -> input_Signup.certification_number에 API 요청 결과값 저장
                                CheckNumber(input_Signup: input_Signup)
                                
                                // 인증되었을 때
                                if input_Signup.certification_number == "success"{
                                    print("인증됨")
                                    result[0] = true
                                }
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            if result[0] {
                                Text("인증되었습니다.").font(.system(size: 11)).foregroundColor(.green)
                            }else{
                                Text("인증 실패되었습니다. 메일을 다시 확인해 주세요.").font(.system(size: 11)).foregroundColor(.red)
                            }
                                
                            
                           
                            Spacer()
                            
                        }
                    }
                    
                    //닉네임
                    Group{
                        HStack{
                           
                            Text("닉네임 |")
                            TextField("",text: $nickname).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                //회원가입 과정 2. 닉네임 중복 여부 확인 API 요청
                                //닉네임 중복 여부
                                if check_nickname(nickname: nickname) == "Available" {
                                    result[1] = true
                                }
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            if result[1] {
                                Text("사용 가능한 닉네임입니다.").font(.system(size: 11)).foregroundColor(.green)
                            }else{
                                Text("사용 불가능한 닉네임입니다. 다시 입력해 주세요").font(.system(size: 11)).foregroundColor(.red)
                            }
                            Spacer()
                            
                        }
                        Spacer()
                        
                    }
                    Text("비밀번호 입력").fontWeight(.bold)
                    //비밀번호
                    Group{
                        HStack{
                            Text("비밀번호 |")
                            TextField("",text: $pw).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                //회원가입 과정 3. 비밀번호 조건 부합 여부 확인
                                //비밀번호 사용가능 여부 확인
                                if true {
                                    result[2] = true
                                }
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            VStack{
                                if result[2]{
                                    Text(" 사용 가능한 비밀번호입니다.").font(.system(size: 11)).foregroundColor(.green)
                                }else {
                                    Text("* 8~ 15 이하로 입력해 주세요.").font(.system(size: 11))
                                    Text("  영문자,숫자,특수문자만 가능합니다..").font(.system(size: 11))
                                }
                                
                            }

                            Spacer()
                            
                        }
                    }
                    Group{
                        HStack{
                            Text("비밀번호 확인|")
                            TextField("",text: $checkPw).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                //회원가입 과정 4. 비밀번호 동일한지 확인
                                if check_pw(pw: pw, check_pw: checkPw) {
                                    result[3] = true
                                }
                            }label: {
                                Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                            }
                        }
                        HStack{
                            Spacer()
                            if result[3]{
                                Text(" 비밀번호가 일치합니다.").font(.system(size: 11)).foregroundColor(.green)
                            }else {
                                Text(" 비밀번호가 일치하지 않습니다.").font(.system(size: 11)).foregroundColor(.red)
                            }
                            
                            Spacer()
                            
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            //회원가입 과정 5. 위의 과정을 다 거쳤는지 확인 == result의 모든 값이 true여만 회원가입 가능
                            if result.contains(false) {
                                signup_result_alert = true
//                                print("임시 회원가입 : \(goSignup(Info: Signup_info(user_id: "13wjdgk@gnu.ac.kr", user_pw: "12345", nickname: "hellllllllll")))")
//                                login_state = login(login: Login(user_id: "13wjdgk@gnu.ac.kr", user_pw: "12345" ), token: &token)
                                login_state = 1
                                signup_result = "가입실패"
                                
                            }else{
                                //회원가입 과정 6. 회원가입 API 요청
                                if goSignup(Info: Signup_info(user_id: "\(email)@gnu.ac.kr", user_pw: pw, nickname: nickname)) {
//
                                    signup_result_alert = true
                                    signup_result =  "가입완료"
                                    token[0] = "\(email)@gnu.ac.kr"
                                   
//                                    //회원가입 과정 7. 로그인 API 요청
                                    login_state = login(login: Login(user_id: "\(email)@gnu.ac.kr", user_pw: pw ), token: &token)
//
//                                    //API에서 로그인이 성공되면
//
                                }
                                
                            }
                        }label: {
                            Text("가입하기").frame(width: 80, height: 25, alignment: .center).background(.gray).foregroundColor(.white).alert( "회원가입", isPresented: $signup_result_alert) {
                                Button{
                                    signup_result_alert = false
                                    goView = false
                                  
                                }label: {
                                    Text("확인")
                                }
                            } message: {
                                Text(signup_result)
                            }
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
        SignUpView(coreDM:.constant(CoreDataManager()) , goView : .constant(true), login_state : .constant(-1), token: .constant([""]))
    }
}
