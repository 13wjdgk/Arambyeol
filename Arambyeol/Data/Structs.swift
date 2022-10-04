//
//  Structs.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//

import Foundation

// 로그인
struct Login : Codable{
    let user_id : String
    let user_pw : String
}
// 로그인 결과
struct Login_result : Codable{
    let access_token : String
    let refresh_token : String
    let result : String
    var nickname : String
}

//메일 인증
struct Mail : Codable{
    let mail : String
    
    enum CodingKeys : String, CodingKey{
        case mail
    }
}
// 메인 인증 번호 확인
struct CertificationNumber : Codable{
    let mail : String
    let number : Int
    
    enum CodingKeys : String, CodingKey{
        case mail
        case number
    }
}
// 회원가입
struct Signup_info : Codable {
    let user_id : String
    let user_pw : String
    let nickname : String
}
struct Nickname : Codable{
    let nickname : String
}

struct change_nickname : Codable {
    let access_token : String
    let user_id : String
    let nickname : String
}

// API 결과
struct API_result : Codable {
    let result : String
}

// 로그아웃
// 로그아웃 결과



// post 업로드시 필요 struct
struct add_Post : Codable{
    let image : String
    let access_token : String
    let title : String
    let content : String
    let score : Int
    let meal_time : String
    let user_id : String
    enum CodingKeys : String, CodingKey{
        case image
        case access_token
        case title
        case content
        case score
        case meal_time
        case user_id
    }
}
// post load시 받을 struct
struct get_post : Codable {
//    let content : String
//    let date : String
    let image : String?
//    let like : Int
    let meal_time : String
    let post_id : Int
    let score : Int
    let title : String
    let nickname : String
}
// post load시 받을 struct
struct get_Posts : Codable{
    var result : [get_post]
    
    enum CodingKeys : String, CodingKey{
        case result = "result"
    }
    
}

struct go_get_Post :Codable{
    var access_token : String
    var times : Int
}

struct delete_Post : Codable{
    let access_toke : String
    let post_id : Int
}
struct like_Post : Codable{
    let access_token : String
    let post_id : Int
    let status : String
}

// post load시 받을 struct
struct get_menu : Codable {
    let menu_id : Int
    let menu : String
    let score : Float
    let course : String
}
// post load시 받을 struct
struct day_menu : Codable {
        var morning : [get_menu]
        let lunch : [get_menu]
        let dinner : [get_menu]
}
// post load시 받을 struct
struct get_Menus : Codable{
    let 월 : day_menu
    let 화 : day_menu
    let 수 : day_menu
    let 목 : day_menu
    let 금 : day_menu
    let 토 : day_menu
    let 일 : day_menu

    
}




//Menu
struct Menu : Codable{
 
    
}
