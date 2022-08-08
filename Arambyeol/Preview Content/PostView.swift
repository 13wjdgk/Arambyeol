//
//  PostView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/31.
//

import SwiftUI


struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct PostView: View {
    var body: some View {
        ZStack{
            GroupBox{
                Text("hi")
                Text("hello")
            }.groupBoxStyle(TransparentGroupBox())
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
