//
//  Sign in.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation
import CoreData
//로그인
func login (login : Login,success : User){

    guard let uploadData = try?JSONEncoder().encode(login) else {
        return
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
              
              let Result: Login_result = try JSONDecoder().decode(Login_result.self, from: data)
              print("성공? : ")
              user.user_id = login.user_id
              user.access_token = Result.access_token
              user.refresh_token = Result.refresh_token
              user.success = true
              user.nickname = Result.nickname
              print(Result)
          } catch let error {
              do{
                  let Result: result = try JSONDecoder().decode(result.self, from: data)
                  print("로그인 실패")
              }catch let error{
                  print("err남")
                  print(error)
              }
              
             
          }
          
        }else {return}
    }
    task.resume()
    sleep(1)
}
