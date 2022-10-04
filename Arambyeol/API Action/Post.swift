//
//  Post.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation
import SwiftUI

// 포스트 보내기
func goPosting (Post : add_Post) {
//    print("imagee : \(Post.image.base64EncodedString())")
    guard let uploadData = try? JSONEncoder().encode(Post) else {print("err0r 01"); return }
    print("how : \(uploadData)")
//    let iimage: test_image = try JSONDecoder().decode(test_image.self, from: uploadData)
//    print("image : \(iimage)")
    print("data : \(uploadData)")
    let url = URL(string: "http://43.201.37.66:5000/post/detail")
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
              print("성공? : ")
              print(Result)
          } catch let error {
              print("err남")
              print(error)
          }

        }else {return}
    }
    task.resume()

}
func deletePost(){
    guard let url = URL(string: "http://43.201.37.66:5000/post/detail") else {
               print("Error: cannot create URL")
               return
           }
           // Create the request
           var request = URLRequest(url: url)
           request.httpMethod = "DELETE"
           URLSession.shared.dataTask(with: request) { data, response, error in
               guard error == nil else {
                   print("Error: error calling DELETE")
                   print(error!)
                   return
               }
               if let data = data {

                 do {
                     let Result: API_result = try JSONDecoder().decode(API_result.self, from: data)
                     print("성공? : ")
                     print(Result)
                 } catch let error {
                     print("err남")
                     print(error)
                 }

               }else {return}
           }.resume()
}
//post list 가져오기
func get_PostList(access_token : String , times : Int ) -> Bool{
    var result_B = false
    
    guard let uploadData = try?JSONEncoder().encode(go_get_Post(access_token: access_token, times: times)) else {
        return result_B
    }
    let url = URL(string: "http://43.201.37.66:5000/post/list")
    var request = URLRequest(url: url!)
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
        
        // 서버가 응답이 없거나 통신이 실패
        if let e = error {
            NSLog("An error has occured: \(e.localizedDescription)")
            print("list 불러오기 실패 : \(e.localizedDescription) ")
            return
        }
        if let data = data {
          
          do {
              print("받아온 데이터 : \(data)")
//              print("받아온 데이터 타입 : \(data)")
              let Result = try JSONDecoder().decode(get_Posts.self, from: data)
//              print("list 불러오기 성공? :\(Result.result) ")
              for result in Result.result{
//                  guard let stringData = Data(base64Encoded: result.nickname),
//                        let uiImage = UIImage(data: stringData) else {
//                            print("Error: couldn't create UIImage")
//                            return
//                        }
//                  print("이미지받음\(result.image)")
                  if result.image != nil{
                      if let data = Data(base64Encoded: result.image!, options: .ignoreUnknownCharacters) {
                          let decodedImg = UIImage(data: data)
                          PostList.append(Post(  image: decodedImg,  meal_time: result.meal_time, post_id: result.post_id, score: result.score, title: result.title,nickname : result.nickname ))
                      }
                  }else{
                      PostList.append(Post(  image: UIImage(),  meal_time: result.meal_time, post_id: result.post_id, score: result.score, title: result.title,nickname : result.nickname ))
                  }
                 
                  
              }
              print("list 저장 성공? :\(PostList) ")
              result_B = true
              

              print(Result)
          } catch let error {
              print("list 불러오기 실패2  ")
              result_B = false
            print("err남 : \(error)")
          }
        }else {return}
    }
    task.resume()
    if result_B == false {
        sleep(1)
        return result_B
    }else{
        return result_B
    }
   
}

func delete_post(post_id : Int , access_token : String ) -> Bool{
    var result_B = false
    guard let url = URL(string: "http://43.201.37.66:5000/post/detail") else {
               print("Error: cannot create URL")
               return result_B
           }
    guard let uploadData = try?JSONEncoder().encode(delete_Post(access_toke: access_token, post_id: post_id)) else {
        return result_B
    }
           // Create the request
           var request = URLRequest(url: url)
           request.httpMethod = "DELETE"
    request.httpBody = uploadData
           URLSession.shared.dataTask(with: request) { data, response, error in
               guard error == nil else {
                   print("Error: error calling DELETE")
                   print(error!)
                   return
               }
               guard let data = data else {
                   print("Error: Did not receive data")
                   return
               }
               guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                   print("Error: HTTP request failed")
                   return
               }
               do {
                   guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                       print("Error: Cannot convert data to JSON")
                       return
                   }
                   guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                       print("Error: Cannot convert JSON object to Pretty JSON data")
                       return
                   }
                   guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                       print("Error: Could print JSON in String")
                       return
                   }
                   
                   print(prettyPrintedJson)
               } catch {
                   print("Error: Trying to convert JSON data to string")
                   return
               }
           }.resume()
    return result_B
    
}

func like_post(post_id : Int , access_token : String , status : String){
        guard let uploadData = try? JSONEncoder().encode(like_Post(access_token: access_token, post_id: post_id, status: status)) else {print("err0r 01"); return }
        print("how : \(uploadData)")
        let url = URL(string: "http://43.201.37.66:5000/post/likes")
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
                  print("성공? : ")
                  print(Result)
              } catch let error {
                  print("err남")
                  print(error)
              }

            }else {return}
        }
        task.resume()

}
