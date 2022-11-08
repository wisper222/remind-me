//
//  WelcomeView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var welcomeView:Bool
    
    var sirkaContentu: CGFloat = UIScreen.main.bounds.width * 0.84
    @State var visible = false
    var body: some View {
        VStack(spacing: 2){
            
            Image("icon")
                
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 80)
                .padding(.top, 30)
                
            
            Text("""
                    Vitajte v aplikácii
                    RemindMe!
                    """)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            InfoSnippet(ikonka: "bell.badge", nadpis: "Šikovné upozornenia", podnadpis: "Dostávajte upozornenia, keď sa vám začnú míňať lieky, takže si viete zaobstarať nové alebo kontaktovať svojho lekára", farba1: .red, farba2: .blue)
            
            
            
            InfoSnippet(ikonka: "calendar.badge.clock", nadpis: "Prispôsobenie", podnadpis: "Prispôsobte si upozornenia podľa seba. Nastavte si rôzne časy upozornení spolu s rôznymi dňami.", farba1: Color("ciernaIkonka"), farba2: .blue)
            
            
            
            Spacer()
                
            Button(action: dismiss) {
                Text("Pokračovať")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: sirkaContentu)
                    .cornerRadius(40)
                    .background(Color.blue)
                    .cornerRadius(18)
                    .padding(.bottom, 40)
                    
            }
            
            
            
        }.interactiveDismissDisabled()
        
        
    }
    
    func dismiss(){
        welcomeView = false
        visible = true
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {

        WelcomeView(welcomeView: .constant(false))
    }
}


