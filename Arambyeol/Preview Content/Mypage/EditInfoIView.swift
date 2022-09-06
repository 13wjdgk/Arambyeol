//
//  EditInfoIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/05.
//

import SwiftUI
import CoreData
struct EditInfoIView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Binding var goView : Bool
    @State var input_Signup = certifiaction_mail(mail: "", number: 0, certification_number: "")
    @State var result01 = "인증 실패되었습니다. 다시 시도하십시오"
    @State var email = ""
    @State var nickname = ""
    @State var tPw = ""
    @State var pw = ""
    @State var checkPw = ""
    @State var result = [true,false,true]
    @State var number : String = ""
    @Binding var user : User
    @State var alert_nickname = false
    @State var alser_nickname_text = "닉네임 변경에 실패했습니다."
    //User 정보 변경사항 user 변수에 적용
    func updateUser(user : inout User , coreDM : CoreDataManager){
        let new_user = coreDM.get_user()
        user.user_id = new_user.user_id
        user.nickname = new_user.nickname
        user.access_token = new_user.access_token
        user.refresh_token = new_user.refresh_token
    }
    //닉네임 변경 coreData 적용
    func changeNickname_coreDM(newNickname : String , user : inout User, coreDM : CoreDataManager , content : NSManagedObjectContext){
        coreDM.updateNickname(newnickName: newNickname, content: content)
        updateUser(user: &user, coreDM: coreDM)
    }
    var body: some View {
        NavigationView {
            GroupBox{
                VStack(alignment: .leading){
                    Text("정보입력").fontWeight(.bold).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    //이메일
                    HStack{
                        Text("이메일 |")
                        Text(user.user_id!)
                        
                    }
                    

                    
                    //닉네임
                    Group{
                        HStack{
                            Text("닉네임 |")
                            TextField(user.nickname ?? "",text: $nickname).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })
                            Button{
                                alert_nickname = true
                                //닉네임 중복 여부
                                if changeNickname(user: user, newNickname: nickname) {
                                    alser_nickname_text = "닉네임 변경에 성공했습니다."
                                    changeNickname_coreDM(newNickname: nickname, user: &user, coreDM: CoreDataManager(), content: managedObjContext)
                                    
                                }else{
                                    alser_nickname_text = "중복된 닉네임이 존재하거나 변경에 실패했습니다."
                                }
                            }label: {
                                Text("변경").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding().alert("닉네임 변경", isPresented: $alert_nickname){
                                    
                                    Button{
                                        
                                        alert_nickname = false
                                        goView = false
                                        changeNickname_coreDM(newNickname: nickname, user: &user, coreDM: CoreDataManager(), content: managedObjContext)
                                        updateUser(user: &user, coreDM: CoreDataManager())
                               
                                     
                                        print("닉네임 변경 결과: \(user.nickname)")
                                    }label: {
                                        Text("확인")
                                    }
                                   
                                }message: {
                                    Text(alser_nickname_text)
                                    
                                }
                                }
                            }
                        }
                     
                        Spacer()
                        
                    
                    Text("비밀번호 입력").fontWeight(.bold)
                    //비밀번호
                Group{
                    HStack{
                        Text("현재 비밀번호 |")
                        TextField("",text: $tPw).overlay(VStack{Divider().offset(x: 0, y: 14)
                        })
                        Button{
                            //비밀번호 사용가능 여부 확인
                            if true {
                                result[2] = true
                            }
                        }label: {
                            Text("확인").background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray).frame(width:50,height: 25)).padding()
                        }
                    }
                }
                    Group{
                        HStack{
                            Text("새 비밀번호 |")
                            TextField("",text: $pw).overlay(VStack{Divider().offset(x: 0, y: 14)
                            })

                        }
                        HStack{
                            Spacer()
                            VStack{
                                if true && (pw != "") && (pw != tPw) {
                                    
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

                        }
                        HStack{
                            Spacer()
                            if (pw == ""){
                                
                            }
                            else if (checkPw == pw) {
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
                            if result.contains(false){
                                print("가입실패")
                            }else{
                                goSignup(Info: Signup_info(user_id: "\(email)@gnu.ac.kr", user_pw: pw, nickname: nickname))
                                print("가입완료")
                            }
                        }label: {
                            Text("가입하기").frame(width: 80, height: 25, alignment: .center).background(.gray).foregroundColor(.white)
                        }
                        Spacer()
                    }
                   
                   
                    
                }
            }.padding()
                .navigationTitle("내 정보 수정").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditInfoIView_Previews: PreviewProvider {
    static var previews: some View {
        EditInfoIView( goView: .constant(false), user: .constant(User()))
    }
}
