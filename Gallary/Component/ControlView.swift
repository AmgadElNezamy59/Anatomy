//
//  ControlView.swift
//  Gallary
//
//  Created by Amgad ElNezamy on 10/05/2023.
//

import SwiftUI

struct ControlView: View {
    @Binding var Scale : CGFloat
    @Binding var offset : CGSize

    var body: some View {
        HStack{
            Button {
                if Scale > 1{
                    Scale = Scale - 1
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            
            Button {
                Scale = 1
                offset = .zero
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            
            Button {
                if Scale < 5   {
                    Scale = Scale + 1
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }


            
            
        }//Hsatack
        .padding(.vertical,10)
        .padding(.horizontal,15)
        .background(.gray)
        .foregroundColor(.white)
        .cornerRadius(20)
        .font(.largeTitle)
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(Scale: .constant(1), offset: .constant(.zero))
        
    }
}
