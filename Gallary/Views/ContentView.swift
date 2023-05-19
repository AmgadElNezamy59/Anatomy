//
//  ContentView.swift
//  Gallary
//
//  Created by Amgad ElNezamy on 09/05/2023.
//

import SwiftUI

struct ContentView: View {
    //properties
    var gradient : [Color] = [Color("red02"),Color("red01")]
    
    @State var imageScale : CGFloat = 1
    @State var imageOffSet :CGSize = .zero
    
    let Covers:[Cover] = CoverData
    @State var coverIndex : Int = 0
    
    private func resetImage(){
        imageScale = 1
        imageOffSet = .zero
    }
    var body: some View {
        
        ZStack {
            
            

            VStack {
                
                Text(Covers[coverIndex].coverTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top,30)
                    .foregroundColor(.orange)
                    .fontWeight(.heavy)
//                    .font(.largeTitle)
                    .font(.custom(
                           "AmericanTypewriter",
                           fixedSize: 36))
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 0.5)

                

                
                Image(Covers[coverIndex].coverName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(15)
                    .scaleEffect(imageScale)
                    .offset(x:imageOffSet.width , y:imageOffSet.height)
                
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5)
                //[1] tap gasture
                    .onTapGesture(count: 2) {
                        withAnimation (.spring()){
                            if imageScale == 1 {
                                imageScale = 5
                            }else{
                                resetImage()
                            }
                        }
                        
                        
                    }
                //[2] drag gasture
                    .gesture(DragGesture()
                        .onChanged({ gesture in
                            imageOffSet = gesture.translation
                        })
                            .onEnded({_ in
                                withAnimation (.spring()) {
                                    if imageScale <= 1 {
                                        resetImage()
                                    }
                                }
                                
                                
                            })
                             
                    )
                
                //Magnification
                
                    .gesture(MagnificationGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                imageScale = value
                                
                            }
                            
                        })
                            .onEnded({ value in
                                withAnimation (.spring()){
                                    if imageScale > 5{
                                        imageScale = 5
                                    }else if imageScale < 1{
                                        imageScale = 1
                                    }
                                }
                                
                                
                            })
                    ).overlay(alignment:.topTrailing) {
                        
                        DrawerView(index: $coverIndex)
                        
                    }
                    .overlay(alignment:.bottom){
                        ControlView(Scale: $imageScale, offset: $imageOffSet)
                        
                        
                        
                    }
                
                
            } .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
