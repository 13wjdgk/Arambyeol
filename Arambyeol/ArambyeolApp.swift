//
//  ArambyeolApp.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/28.
//

import SwiftUI

@main
struct ArambyeolApp: App {
    let persistenceController = PersistenceController.shared
    


    
    //앱이 시작될 때 한 번 저장소를 생성한 다음 SwiftUI 환경 내에 저장한다. 모든 곳에서 사용할 수 있다.
    
    
    var body: some Scene {
        WindowGroup {
            //ContentView() 줄에 새 수정자를 추가하여 SwiftUI 환경에 배치할 수 있다.
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }

    }
}

