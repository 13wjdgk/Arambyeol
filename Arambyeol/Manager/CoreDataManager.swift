//
//  CoreDataManager.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/04.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "Arambyeol")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    //로그인 정보 저장
    func login_user(user_id :String,access_token : String,refresh_token : String){
        print("실행")
        let user  = User(context: persistentContainer.viewContext)
        print("user 1 : \(user)")
        user.user_id = user_id
        print("user 2 : \(user)")
        user.access_token = access_token
        print("user 3 : \(user)")
        user.refresh_token = refresh_token
        print("user 4 : \(user)")
        do {print("실행")
            try persistentContainer.viewContext.save()
        }catch{
            print("Failed to save movie \(error)")
        }
    }
    
    //로그인 정보 가져오기
    func get_user() -> [User]{
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do{
            let result = try persistentContainer.viewContext.fetch(fetchRequest)
            print("count :")
            print(result.count)
            return result
        } catch{
            print("fail")
            return []
        }
    }
    
    func delete_user( user : User) {
        persistentContainer.viewContext.delete(user)
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("delete failed : \(error)")
        }
    }
}
