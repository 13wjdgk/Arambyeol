//
//  Post.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation


// 사진 포스팅
func goPosting (Post : Posting){
//    print("imagee : \(Post.image.base64EncodedString())")
    guard let uploadData = try? JSONEncoder().encode(Post) else {print("err0r 01"); return }
    print("how : \(uploadData)")
//    let iimage: test_image = try JSONDecoder().decode(test_image.self, from: uploadData)
//    print("image : \(iimage)")
    print("data : \(uploadData)")
    let url = URL(string: "http://203.255.3.246:5004/post/detail")
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
              let Result: result = try JSONDecoder().decode(result.self, from: data)
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
    guard let url = URL(string: "http://203.255.3.246:5004/post/detail") else {
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
                     let Result: result = try JSONDecoder().decode(result.self, from: data)
                     print("성공? : ")
                     print(Result)
                 } catch let error {
                     print("err남")
                     print(error)
                 }

               }else {return}
           }.resume()
}
