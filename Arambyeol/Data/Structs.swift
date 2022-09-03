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

// API 결과
struct result : Codable {
    let result : String
}

// 로그아웃
// 로그아웃 결과



// post
struct Posting : Codable{
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

struct delete_Post : Codable{
    let access_toke : String
    let post_id : Int
}

//Menu
struct Menu : Codable{
  
    struct 월 {
        var morning : String
        let lunch : String
        let dinner : String
    }
    struct 화 {
        let morning : String
            let lunch : String
            let dinner : String
    }
    struct 수{
        let morning : String
            let lunch : String
            let dinner : String
    }
    struct 목 {
        let morning : String
            let lunch : String
            let dinner : String
    }
    struct 금 {
        let morning : String
            let lunch : String
            let dinner : String
    }
    struct 토 {
        let morning : String
            let lunch : String
            let dinner : String
    }
    struct 일 {
        let morning : String
        let lunch : String
        let dinner : String
    }
    
}
