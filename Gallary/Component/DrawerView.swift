//
//  DrawerView.swift
//  Gallary
//
//  Created by Amgad ElNezamy on 10/05/2023.
//

import SwiftUI

struct DrawerView: View {
    //properties
    let covers : [Cover] = CoverData
    @State var isDrawerOpen : Bool = false
    @Binding var index : Int

    
    var body: some View {
        HStack{
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height:40,alignment: .center)
                .padding(8)
                .foregroundColor(.secondary)
                .onTapGesture {
                    isDrawerOpen.toggle()
                }
            Spacer()
            
            ForEach(covers) { item in
                Image(item.coverName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120,alignment: .center)
                    .padding(.trailing,10)
                    .onTapGesture {
                        index = item.id - 1
                    }
            }
            

            
        }//Hstack
        .frame(width: 260)
        .background(.thinMaterial)
        .cornerRadius(8)
        .offset(x:isDrawerOpen ? 0 : 230)
    }
}




struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(index: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
