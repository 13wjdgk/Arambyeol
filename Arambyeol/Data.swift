//
//  Data.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//

import Foundation
//"title" : "오늘 맛있더라~",
//        "category" : "오늘의 점심",
//        "nickname" : "13wjdgk",
//        "posting_id" : 2,
//        "date": "2021-01-01 17:02",
//        "score" : 5

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
//class PostStore : ObservableObject{
//    @Published var PostList : [Post]
//    init(){
//        PostList = [Post(post_id: 1, title: "오늘 아람 존맛탱", category: "오늘의 아람 후기", nickname:"dongg", score: 5, insertDate: Date.now),Post(post_id: 2, title: "오늘 아람 머리카락 나옴 ㅠㅠ", category: "아람 문의 / 건의", nickname:"dongg222", score: -1, insertDate: Date.now)
//,Post(post_id: 3, title: "도스마스 배달시킬 사람", category: "아람이 맛없을 땐?", nickname:"dongg44", score: -1, insertDate: Date.now)
//]
//    }
//}


//class MemoStore : ObservableObject{
//    @Published var list : [Memo] // 배열을 업데이트할 때마다 배열이 바인딩된 뷰도 자동으로 업데이트 된다.
//    init(){
//        list = [
//            Memo(content: "hello",insertDate: Date.now),
//            Memo(content: "Awesome",insertDate: Date.now.addingTimeInterval(3600 * -24)),
//            Memo(content: "SwiftUI",insertDate: Date.now.addingTimeInterval(3600 * -48)),
//
//        ]
//    }
//    func insert(memo : String){
//        list.insert(Memo(content: memo), at: 0)
//    }
//
//    func update(memo : Memo?,content : String){
//        guard let memo = memo else {
//            return
//        }
//        memo.content = content
//    }
//
//    func delete(memo : Memo){
//        list.removeAll(){$0.id == memo.id}
//    }
//
//    func delete(set : IndexSet){
//        for index in set{
//            list.remove(at: index)
//        }
//    }
//}

