//
//  Data.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//

import Foundation
//coreData 대신




// 메일 인증
class certifiaction_mail : ObservableObject {
    var mail : String
    var number: Int
    var certification_number : String
    init(mail : String,number: Int,certification_number : String){
        self.mail = mail
        self.number = number
        self.certification_number = certification_number
    }
}
//Post
class Post : Identifiable,ObservableObject{
    let id : UUID //Identifiable에 필요한 속성
    let post_id : Int
    @Published var title : String
    @Published var category : String
    let nickname : String
    let score : Int
    let insertDate : Date
    init(post_id : Int,title : String,category : String,nickname : String,score : Int,insertDate : Date){
        id = UUID()
        self.post_id = post_id
        self.title = title
        self.category = category
        self.nickname = nickname
        self.score = score
        self.insertDate = insertDate
        
    }
    
}


var PostList : [Post] = [Post(post_id: 1, title: "오늘 아람 존맛탱", category: "오늘의 아람 후기", nickname:"dongg", score: 5, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
                        ,Post(post_id: 3, title: "도스마스 배달시킬 사람", category: "아람이 맛없을 땐?", nickname:"dongg44", score: -1, insertDate: Date.now),Post(post_id: 1, title: "오늘 아람 존맛탱", category: "오늘의 아람 후기", nickname:"dongg", score: 5, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
                         ,Post(post_id: 3, title: "도스마스 배달시킬 사람", category: "아람이 맛없을 땐?", nickname:"dongg44", score: -1, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
                         ,Post(post_id: 3, title: "도스마스 배달시킬 사람", category: "아람이 맛없을 땐?", nickname:"dongg44", score: -1, insertDate: Date.now),Post(post_id: 1, title: "오늘 아람 존맛탱", category: "오늘의 아람 후기", nickname:"dongg", score: 5, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
                          ,Post(post_id: 3, title: "도스마스 배달시킬 사람", category: "아람이 맛없을 땐?", nickname:"dongg44", score: -1, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
                        ]

