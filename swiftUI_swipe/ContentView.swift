//
//  ContentView.swift
//  swiftUI_swipe
//
//  Created by Yumi Machino on 2021/03/16.
//

import SwiftUI

struct ContentView: View {
    
    /// State property to manage swipe motion
    @State var x : [CGFloat] = [0,0,0,0,0,0,0]
    @State var degree : [Double] = [0,0,0,0,0,0,0]
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            
            /// when swiped 7 times, it shows return image on the screen
            Button(action: {
                
                for i in 0..<self.x.count {
                    self.x[i] = 0
                }
                
                for i in 0..<self.degree.count {
                    self.degree[i] = 0
                }
                
            }) {
                Image(systemName: "return").font(.title)
            }
            
            ZStack {
                
                /// generate 7 Card objects, each with swipe gesture features
                ForEach(0..<7, id: \.self){ i in
                    Card()
                        .offset(x: self.x[i])
                        .rotationEffect(.init(degrees: self.degree[i]))
                        /// swipe gesture
                        .gesture(DragGesture()
                                 .onChanged({ (value) in
                                    if value.translation.width > 0 {
                                        self.x[i] = value.translation.width
                                        self.degree[i] = 8
                                    } else {
                                        self.x[i] = value.translation.width
                                        self.degree[i] = -8
                                    }
                                })
                                .onEnded({ (value) in
                                        
                                    if value.translation.width > 0 {
                                            
                                        if value.translation.width > 100 {
                                                
                                            self.x[i] = 500
                                            self.degree[i] = 15
                                        
                                        } else {
                                            
                                            self.x[i] = 0
                                            self.degree[i] = 0
                                                
                                        }
                                    } else {
                                        if value.translation.width < -100 {
                                                
                                            self.x[i] = -500
                                            self.degree[i] = -15
                                        
                                        } else {
                                            
                                            self.x[i] = 0
                                            self.degree[i] = 0
                                                
                                        }
                                    }
                                }))
                }
            }.padding()
            .animation(.default)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}



/// represents card object
struct Card: View {
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            /// contains one image and 4 buttons, and string on the image
            VStack {
                
                Image("van")
                    .resizable()
                    .frame(height: 410, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                /// contains 4 buttons horizontally
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
                    
                    // first button
                    Button(action: {
                        
                    }, label: {
                        // could be Image
                        Text("")
                            .frame(width: 45, height: 45, alignment: .center)
                    }).background(Color.green)
                    .clipShape(Circle())
                    
                    // second button
                    Button(action: {
                        
                    }, label: {
                        // could be Image
                        Text("")
                            .frame(width: 45, height: 45, alignment: .center)
                    }).background(Color.yellow)
                    .clipShape(Circle())
                    
                    // third button
                    Button(action: {
                        
                    }, label: {
                        // could be Image
                        Text("")
                            .frame(width: 45, height: 45, alignment: .center)
                    }).background(Color.red)
                    .clipShape(Circle())
                    
                    // forth button
                    Button(action: {
                        
                    }, label: {
                        // could be Image
                        Text("")
                            .frame(width: 45, height: 45, alignment: .center)
                    }).background(Color.gray)
                    .clipShape(Circle())
                    
                }.padding(10)
            }.background(Color.white)
            .cornerRadius(25)
            
            /// repersents string on the image
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Vancouver")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("BC")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }.padding(.bottom, 100)
            .padding(.leading, 10)
        }
    }
    
}
