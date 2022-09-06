//
//  Sign in.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation
import CoreData
//로그인
func login (login : Login , token : inout [String]) -> Int {
    //로그인 성공 여부
    var result_B = -1
    var Results = ["","",""]
    guard let uploadData = try?JSONEncoder().encode(login) else {
        return -1
    }
    let url = URL(string: "http://203.255.3.246:5004/login/app")
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
              
              let Result : Login_result = try JSONDecoder().decode(Login_result.self, from: data)
              print("성공? : ")
              result_B = 1
              Results[0] = Result.access_token
              Results[1] = Result.refresh_token
              Results[2] = Result.nickname

              print(Result)
          } catch let error {
              do{
                  let Result: API_result = try JSONDecoder().decode(API_result.self, from: data)
//                  success.success = false
                  print("로그인 실패")
                  result_B = 0
              }catch let error{
//                  success.success = false
                  print("err남")
                  print(error)
              }
          }
        }else {return}
    }
    task.resume()
    sleep(5)
    token[0] = Results[0]
    token[1] = Results[1]
    token[2] = Results[2]
    return result_B
}
//닉네임 변경
func changeNickname(user : User , newNickname : String) -> Bool {
    print("access token 확인")
    print( user.access_token!)
    var result_B = false
    guard let uploadData = try?JSONEncoder().encode(change_nickname(access_token: user.access_token! , user_id: user.user_id!, nickname: newNickname)) else {return false}
    let url = URL(string: "http://203.255.3.246:5004/member/nickname")
    var request = URLRequest(url: url!)
    request.httpMethod = "Put"
    request.httpBody = uploadData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 서버가 응답이 없거나 통신이 실패
        if let e = error {
            NSLog("An error has occured: \(e.localizedDescription)")
            return
        }
        if let data = data {
          
          do {
              
              let Result : API_result = try JSONDecoder().decode(API_result.self, from: data)
             
              if Result.result == "success"{
                  print("성공? : ")
                  print(Result)
                  result_B = true
              }else{
                  print(newNickname)
                  print("실패")
              }
              print(Result)
          } catch let error {
              print("err남")
              print(error)
              result_B = false
              }
        }else {return}
            }.resume()
    sleep(1)
    return result_B
}
