//
//  MainSwiftUIView.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/28.
//

import SwiftUI

struct MainSwiftUIView: View {
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("아람별행성").resizable().frame(width: 112, height: 107).padding()
                    Text("오늘의 아람").foregroundColor(.white).padding()
                    HStack{
                
                        GroupBox {
                            Text("아침").foregroundColor(.black).fontWeight(.bold)
                            Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("부대덮밥").font(.system(size: 15))
                                Text("우동국").font(.system(size: 15))
                                Text("부들어묵볶음").font(.system(size: 15))
                                Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                            Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("김치말이국수").font(.system(size: 15))
                                Text("오징어야채핫바").font(.system(size: 15))
                                Text("단무지").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                        }
                        GroupBox {
                            Text("아침").foregroundColor(.black).fontWeight(.bold)
                            Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("부대덮밥").font(.system(size: 15))
                                Text("우동국").font(.system(size: 15))
                                Text("부들어묵볶음").font(.system(size: 15))
                                Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                            Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("김치말이국수").font(.system(size: 15))
                                Text("오징어야채핫바").font(.system(size: 15))
                                Text("단무지").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                        }
                        GroupBox {
                            Text("아침").foregroundColor(.black).fontWeight(.bold)
                            Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("부대덮밥").font(.system(size: 15))
                                Text("우동국").font(.system(size: 15))
                                Text("부들어묵볶음").font(.system(size: 15))
                                Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                            Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                            Group{
                                Text("김치말이국수").font(.system(size: 15))
                                Text("오징어야채핫바").font(.system(size: 15))
                                Text("단무지").font(.system(size: 15))
                                Text("배추김치").font(.system(size: 15))
                                Text("망고주스").font(.system(size: 15))
                            }
                        }
                    }
                    Text("7월 21 목요일").foregroundColor(.white).padding()
                    GroupBox {
                        HStack{
                            VStack{
                                Text("아침").foregroundColor(.black).fontWeight(.bold)
                                Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("부대덮밥").font(.system(size: 15))
                                    Text("우동국").font(.system(size: 15))
                                    Text("부들어묵볶음").font(.system(size: 15))
                                    Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                                Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("김치말이국수").font(.system(size: 15))
                                    Text("오징어야채핫바").font(.system(size: 15))
                                    Text("단무지").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                            }
                            VStack{
                                Text("아침").foregroundColor(.black).fontWeight(.bold)
                                Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("부대덮밥").font(.system(size: 15))
                                    Text("우동국").font(.system(size: 15))
                                    Text("부들어묵볶음").font(.system(size: 15))
                                    Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                                Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("김치말이국수").font(.system(size: 15))
                                    Text("오징어야채핫바").font(.system(size: 15))
                                    Text("단무지").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                            }
                            VStack{
                                Text("아침").foregroundColor(.black).fontWeight(.bold)
                                Text("A코스 / 한식").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("부대덮밥").font(.system(size: 15))
                                    Text("우동국").font(.system(size: 15))
                                    Text("부들어묵볶음").font(.system(size: 15))
                                    Text("치커리오리엔탈소스무침").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                                Text("B코스 / 일품").foregroundColor(.black).fontWeight(.semibold)
                                Group{
                                    Text("김치말이국수").font(.system(size: 15))
                                    Text("오징어야채핫바").font(.system(size: 15))
                                    Text("단무지").font(.system(size: 15))
                                    Text("배추김치").font(.system(size: 15))
                                    Text("망고주스").font(.system(size: 15))
                                }
                            }
                           

                        }
                    }
                }
            }

        }
        
    }
}

struct MainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainSwiftUIView()
    }
}
