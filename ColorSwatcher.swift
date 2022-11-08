//
//  ColorSwatcher.swift
//  RemindMe2
//
//  Created by Alex Garay on 19/10/2021.
//

import SwiftUI

struct ColorSwatcher: View {
    @Binding var selection:String
    
    let swatches = [
        "modra",
        "cervena",
        "modrozelena",
        "zlta",
        "oranzova",
        "indigo",
        "fialova",
        "hneda"
        ]
    
    let columns = [
                GridItem(.adaptive(minimum: 60))
            ]
    
    @State var opacita:Double = 0
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(swatches, id: \.self){ swatch in
                        ZStack {
                            Circle()
                                .fill(Color(swatch))
                                .frame(width: 45, height: 45)
                                .onTapGesture(perform: {
                                    selection = swatch
                                    
                                })
                                .padding(10)

                            if selection == swatch {
                                Circle()
                                    .stroke(Color(swatch), lineWidth: 4)
                                    .frame(width: 60, height: 60)
                                    .opacity(1)
                                
                                
                                
                                
                            }
                        }
                    }
                }
                .padding(10)
        
        
    }
    
}

struct ColorSwatcher_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatcher(selection: .constant("indigo"))
    }
}
