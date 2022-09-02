//
//  PostCreateView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/08/24.
//

import SwiftUI

struct CreateGroupBoxStyle : GroupBoxStyle{
    var background: some View {
        RoundedRectangle(cornerRadius: 5).fill(.white)


        }
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            configuration.label
            configuration.content

        }
        .background(background)

    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}
struct PostCreateView: View {
    @State var star : Int
    @State var title : String = ""
    @State var content : String = ""
    @State var Stars :[String] = ["회색별","회색별","회색별","회색별","회색별"]
    @State var meal_time : String = ""
    @State var time_color : [Color] = [.gray,.gray,.gray]
    @State var showSheet = false
    @State var cancel_sheet = false
    @State var image = UIImage()
    var body: some View {
        
            VStack{
                Image("아람별행성").resizable().frame(width: 182, height: 177)
                HStack{
                    Button{
                        star = 1
                        for ind in 0...4{
                            if ind < star{
                                Stars[ind] = "노란별"
                            }else{
                                Stars[ind] = "회색별"
                            }
                        }
                    }label: {
                        Image("\(Stars[0])").resizable().frame(width: 30, height: 30)
                    }
                    
                    Button{
                        star = 2
                        for ind in 0...4{
                            if ind < star{
                                Stars[ind] = "노란별"
                            }else{
                                Stars[ind] = "회색별"
                            }
                        }
                    }label: {
                        Image("\(Stars[1])").resizable().frame(width: 30, height: 30)
                    }
                    Button{
                        star = 3
                        for ind in 0...4{
                            if ind < star{
                                Stars[ind] = "노란별"
                            }else{
                                Stars[ind] = "회색별"
                            }
                        }
                    }label: {
                        Image("\(Stars[2])").resizable().frame(width: 30, height: 30)
                    }
                    Button{
                        star = 4
                        for ind in 0...4{
                            if ind < star{
                                Stars[ind] = "노란별"
                            }else{
                                Stars[ind] = "회색별"
                            }
                        }
                    }label: {
                        Image("\(Stars[3])").resizable().frame(width: 30, height: 30)
                    }
                    Button{
                        star = 5
                        for ind in 0...4{
                            if ind < star{
                                Stars[ind] = "노란별"
                            }else{
                                Stars[ind] = "회색별"
                            }
                        }
                    }label: {
                        Image("\(Stars[4])").resizable().frame(width: 30, height: 30)
                    }

                }
                Spacer()
                Group{
                    HStack{
                        TextField("제목을 입력해주세요",text: $title)
                        Button{}label: {
                            Text("완료").background(RoundedRectangle(cornerRadius: 5).fill(.blue).frame(width: 50)).foregroundColor(.white)
                        }
                        
                    }
                    Divider()
                    TextEditor(text: $content).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250).lineSpacing(5).opacity(1)
                    Divider()
                    HStack {
                       
                        Image(systemName: "camera.fill").foregroundColor(.white) .onTapGesture {
                            showSheet = true
                        }.sheet(isPresented: $showSheet){
                            ImagePicker(sourceType:.photoLibrary,selectedImage: $image)
                        }
                        Image(uiImage: self.image )
                                      .resizable()
                                      .frame(width: 30, height: 30)
                                      .background(Color.clear)
                                      .aspectRatio(contentMode: .fill).onTapGesture {
                                          if(image != UIImage()){
                                              cancel_sheet = true
                                          }
                                        
                                      }.alert("이미지 삭제", isPresented: $cancel_sheet){
                                         
                                          Button{
                                              self.image = UIImage()
                                          }label: {
                                              Text("삭제")
                                          }
                                          Button{}label: {
                                              Text("취소")
                                          }
                                      }message: {
                                          Text("선택하신 이미지를 삭제하시겠습니까?")
                                      }
                        

                        Spacer().frame(width: 30)
                        Button{
                            meal_time = "아침"
                            time_color[0] = .white
                            time_color[1] = .gray
                            time_color[2] = .gray
                        }label: {
                            Text("아침").foregroundColor(time_color[0])
                        }
                        Button{
                            meal_time = "점심"
                            time_color[0] = .gray
                            time_color[1] = .white
                            time_color[2] = .gray
                        }label: {
                            Text("점심").foregroundColor(time_color[1])
                        }
                        Button{
                            meal_time = "저녁"
                            time_color[0] = .gray
                            time_color[1] = .gray
                            time_color[2] = .white
                        }label: {
                            Text("저녁").foregroundColor(time_color[2])
                        }
                        Spacer()
                    }
                    
                        
                    
                }.groupBoxStyle(CreateGroupBoxStyle()).padding()
                Spacer()
                
            }
            
        
    }
}

struct PostCreateView_Previews: PreviewProvider {
    static var previews: some View {
        PostCreateView(star : 0)
    }
}
