//
//  Sign up.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/02.
//

import Foundation
import SwiftUI


// 인증 메일 보내기
func SendMail(email : String){
    let mail = Mail(mail: "\(email)@gnu.ac.kr")
    guard let SendMail = try? JSONEncoder().encode(mail) else {print("err0r 01"); return }
    let url = URL(string: "http://203.255.3.246:5004/member/mail")
    var request = URLRequest(url: url!)
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.uploadTask(with: request, from: SendMail) { (data, response, error) in
        
        // 서버가 응답이 없거나 통신이 실패
        if let e = error {
            NSLog("An error has occured: \(e.localizedDescription)")
            return
        }
        print("comment post success")
    }
    task.resume()
}

// 인증번호 확인
func CheckNumber(input_Signup :  certifiaction_mail ) -> String {
    let mail = CertificationNumber(mail: "\(input_Signup.mail)@gnu.ac.kr",number: input_Signup.number)
    guard let uploadData = try? JSONEncoder().encode(mail) else {print("err0r 01"); return "" }
    let url = URL(string: "http://203.255.3.246:5004/member/mail/number")
    var request = URLRequest(url: url!)
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
        
        // 서버가 응답이 없거나 통신이 실패
        if let e = error {
            NSLog("An error has occured: \(e.localizedDescription)")
            return
        }
        if let data = data {
          
          do {
              let Result: API_result = try JSONDecoder().decode(API_result.self, from: data)
              print("성공")
              input_Signup.certification_number = Result.result
//              return resResult
              print(input_Signup.certification_number)
          } catch let error {
              print("err남")
              print(error)
          }
          
        }else {return}
    }
    task.resume()
    if input_Signup.certification_number != "success" || input_Signup.certification_number != "no token"{
        sleep(1)
        return input_Signup.certification_number
    }else{
        return input_Signup.certification_number
    }
}
//닉네임 중복여부
func check_nickname(nickname : String) -> String {
    var resResult = ""
    var components = URLComponents(string: "http://203.255.3.246:5004/member/nickname")
    let nicknameValue = URLQueryItem(name: "nickname", value: "\(nickname)")
    components?.queryItems = [nicknameValue]
    let com_url = components?.url

    guard let url = com_url else {
           print("Error: cannot create URL")
           return "err"
       }
       
       var request = URLRequest(url: url)
       request.httpMethod = "GET"
       
       URLSession.shared.dataTask(with: request) { data, response, error in
           guard error == nil else {
               print("Error: error calling GET")
               print(error!)
               return
           }
           if let data = data {
               do {
                   let Result: API_result = try JSONDecoder().decode(API_result.self, from: data)
                   print("성공")
                   resResult = Result.result
     //              return resResult
                   print(resResult)
               } catch let error {
                   print("err남")
                   print(error)
               }           }
           
           
       }.resume()
    if resResult != "Available" || resResult != "Already exists"{
        sleep(1)
        return resResult
    }else{
        return resResult
    }
}


//비밀번호 일치여부 확인
func check_pw(pw : String,check_pw : String) ->Bool{
    if pw == check_pw {
        return true
    }
    else {
        return false
    }
}

//회원가입
func goSignup(Info : Signup_info) -> Bool {
    var result_B = false
    guard let uploadData = try?JSONEncoder().encode(Info) else {
        return result_B
    }
    let url = URL(string: "http://203.255.3.246:5004/member")
    var request = URLRequest(url: url!)
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
        
        // 서버가 응답이 없거나 통신이 실패
        if let e = error {
            print("회원가입 error")
            NSLog("An error has occured: \(e.localizedDescription)")
            return
        }
        if let data = data {
          
          do {
              let Result: API_result = try JSONDecoder().decode(API_result.self, from: data)
              print("회원가입 결과 : \(Result.result)")
              if Result.result == "success"{
                  print("성공? : ")
                  print(Result)
                  result_B = true
              }else{
                  print("회원가입 결과 : \(Result.result)")
                  print("실패")
                  result_B = false
              }
              
          } catch let error {
              print("err남")
              print(error)
          }
          
        }else {return}
    }
    task.resume()
    sleep(2)
    return result_B
}


