//
//  DataController.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/09/03.
//
import CoreData
import Foundation

class DataController : ObservableObject{
    //CoreData에서 사용할 entity 명시
    let container = NSPersistentContainer(name: "User")
    init(){
        //container를 로드
        container.loadPersistentStores { description, error in
            if  let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

}
