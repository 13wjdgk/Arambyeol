//
//  Data.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/10.
//

import Foundation
import UIKit
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
    var id = UUID()
//    var content : String
//    var date : String
    var image : UIImage
//    var like : Int
    var meal_time : String
    var post_id : Int
    var score : Int
    var title : String
    var nickname : String
    init(image : UIImage?,  meal_time : String, post_id : Int, score : Int, title : String, nickname : String){
//        self.content  = content
//        self.date = date
        self.image = image ?? UIImage()
//        self.like = like
        self.meal_time = meal_time
        self.post_id = post_id
        self.score = score
        self.title = title
        self.nickname = nickname
    }
}
//메뉴 세부 정보
class menu_info: Identifiable {
    var id: Int {
        self.menu_id
    }
    var menu_id : Int
    var menu_name : String
    var score : Float
    var course : String
    init(menu_id : Int,menu_name : String,score : Float,course : String){
        self.menu_id = menu_id
        self.menu_name = menu_name
        self.score = score
        self.course = course
    }
}
class menu_course: Identifiable {
    var id = UUID()
    var courseList : [menu_info] = []
}
//하루치 메뉴
class menu_day{
    var morning : [menu_course] = []
    var lunch : [menu_course] = []
    var dinner : [menu_course] = []
}

//메뉴 전체 목록
class MenuList{
    var Mon : [menu_day] = []
    var Tue : [menu_day] = []
    var Wed : [menu_day] = []
    var Thu : [menu_day] = []
    var Fri : [menu_day] = []
    var Sat : [menu_day] = []
    var Sun : [menu_day] = []
}

var PostList : [Post] = []

