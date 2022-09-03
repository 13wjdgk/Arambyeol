//
//  Menu.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation
//메뉴 가져오기
func getMenu(){
    

   if let url = URL(string: "http://203.255.3.246:5004/menu") {
              URLSession.shared.dataTask(with: url) { data, response, error in
                 if let data = data {
                   
                   do {
                       let resArray: Menu = try JSONDecoder().decode(Menu.self, from: data)
                       print("성공")
                       print(resArray)
                       
                   } catch let error {
                       print("err남")
                       print(error)
                   }
                   
                  }
              }.resume()
           }
    }
