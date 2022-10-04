//
//  CoreDataManager.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/04.
//

import Foundation
import CoreData


import CoreData
import Foundation
import SwiftUI

class CoreDataManager : ObservableObject {
    //코어데이터를 관리하는 CoreDataManager
    static var shared: CoreDataManager = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Arambyeol")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // NSManagedObjectContext : 관리 대상 개체에 대한 변경 사항을 조작하고 추적하기 위한 개체 공간
    var context: NSManagedObjectContext {
           return persistentContainer.viewContext
       }
   //NSEntityDescription : Core Data의 entity 대한 설명
       var userEntity: NSEntityDescription? {
           return  NSEntityDescription.entity(forEntityName: "User", in: context)
       }
    //NSEntityDescription : Core Data의 entity 대한 설명
        var postEntity: NSEntityDescription? {
            return  NSEntityDescription.entity(forEntityName: "Post", in: context)
        }
    
    //저장
    func save(content : NSManagedObjectContext) {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    //로그인 시 user 정보 추가
    func add_user(user_id :String,access_token : String,refresh_token : String,nickname : String , content : NSManagedObjectContext){
        let user = User(context: content)
        user.user_id = user_id
        user.access_token = access_token
        user.refresh_token = refresh_token
        user.nickname = nickname
        save(content: content)
    }
    func edit_user(user : User , user_id :String,access_token : String,refresh_token : String,nickname : String , content : NSManagedObjectContext){
        user .user_id = user_id
        user.access_token = access_token

        user.refresh_token = refresh_token
        user.nickname = nickname
        save(content : content)
    }
    
    
    // 로그아웃 시 로그인 정보 삭제
    func delete_user( content : NSManagedObjectContext){
        
        do {
            let fetchResults = User.fetchRequest()
            let results = try content.fetch(fetchResults)
//            print("delete 중 ,,, : \(results.count)")
            
            for result in results {
//                print("delete 중 ,,, : \(result.user_id)")
                content.delete(result)
                let fetchResults = User.fetchRequest()
                let results = try content.fetch(fetchResults)
                print(" delete 중에 : \(results.count)")
            }
            try context.save()
        }catch{
            print("delete failed")
        }
        
    }
    
    //User 정보 가져오기
        func get_user() -> User {
               do {
                   let request = User.fetchRequest()
                   let results = try context.fetch(request)
                   return results[0]
               } catch {
                   print(error.localizedDescription)
               }
               return User()
           }
    
    
    //User 배열 가져오기
    func fetchUsers() -> [User]{
        do {
            let request = User.fetchRequest()
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    //닉네임 변경
    func updateNickname(newnickName : String , content : NSManagedObjectContext) {
        do{
            fetchUsers()[0].nickname = newnickName
                    save(content: content )
           
        }catch{
            print("Failed change nickname")
     
        }
        
            }
    //로그아웃
    func logoutUser(_ user: User, content : NSManagedObjectContext) {
            
            context.delete(fetchUsers()[0])
        save(content : content)
        }
        //전체 유저 목록 삭제
        func deleteAllUser( content : NSManagedObjectContext ) {
            let fetchResults = fetchUsers()
            for result in fetchResults {
                context.delete(result)
            }
            save(content: content)
        }
    //post 정보 저장

    
}







//


//
//class CoreDataManager : ObservableObject {
//    let persistentContainer : NSPersistentContainer
//    init(){
//        persistentContainer = NSPersistentContainer(name: "Arambyeol")
//        persistentContainer.loadPersistentStores { (description, error) in
//            if let error = error {
//                fatalError("Core Data Store failed \(error.localizedDescription)")
//            }
//
//
//
//        }
//    }
//    func save(context : NSManagedObjectContext){
//        do{
//            try context.save()
//            print("save complete")
//        }catch{
//            print("failed save")
//        }
//
//    }
//
//    //로그인 정보 저장
   
//
//    //로그인 정보 가져오기
//    func get_user() -> User{
//        var input_user : User = User()
//        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
//        do{
//            let result = try persistentContainer.viewContext.fetch(fetchRequest)
//            if result.count == 0{
//
//
//            }else {
//                input_user = result[0]
//            }
//
//            print("count :")
//            print(result.count)
//            print(input_user)
//
//        } catch{
//            print("fail")
//        }
//        return input_user
//    }
//    //user 삭제
//    func delete_user( user : User) {
//        persistentContainer.viewContext.delete(user)
//        do{
//            try persistentContainer.viewContext.save()
//        }catch{
//            persistentContainer.viewContext.rollback()
//            print("delete failed : \(error)")
//        }
//    }
//    //user 정보 수정
//    func edit_user( user : User ,user_id :String,access_token : String,refresh_token : String,nickname : String , context : NSManagedObjectContext){
//        user.user_id = user_id
//        user.access_token = access_token
//        user.refresh_token = refresh_token
//        user.nickname = nickname
//        save(context: context)
//    }
//}
