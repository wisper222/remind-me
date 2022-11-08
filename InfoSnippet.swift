//
//  InfoSnippet.swift
//  RemindMe2
//
//  Created by Alex Garay on 19/10/2021.
//

import SwiftUI

struct InfoSnippet: View {
    var sirkaobrazovky:CGFloat = UIScreen.main.bounds.width
    var sirkaContentu: CGFloat = UIScreen.main.bounds.width * 0.84
    @State var ikonka:String = "calendar.badge.clock"
    @State var nadpis:String = "Prispôsobenie"
    @State var podnadpis:String = """
Nastavte si vlastné časy upozornení spolu s rôznymi dňami. Prispôsobte si RemindMe podľa seba.
"""
    @State var farba1:Color = Color("ciernaIkonka")
    @State var farba2:Color = .black
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            
            
            Image(systemName: ikonka)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(farba1, farba2)
                .padding(.trailing)

                
            
            Group {
                VStack(alignment: .leading, spacing: 6){
                    
                    
                    Text(nadpis)
                            .font(.headline)
                            
                    
                            
                        
                            
                        
                        
                        
                    
                        
                    Text(podnadpis)
                        .foregroundColor(.secondary)
                        .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                        .frame(width: sirkaobrazovky * 0.6, alignment: .leading)
                        
                    
                        
                    
                }
            }.frame(width: sirkaobrazovky * 0.64)
        }.frame(width: sirkaContentu)
            .padding(.bottom, 35)
    }
}

struct InfoSnippet_Previews: PreviewProvider {
    static var previews: some View {
        InfoSnippet()
    }
}

//                """
//Dostávajte upozrnenia, keď sa vám začnú míňať lieky, takže si
//viete včas zaobstarať nové alebo
//kontaktovať svojho lekára.
//"""
