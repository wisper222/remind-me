//
//  AddView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var  viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var homeData : HomeViewModel
    @ObservedObject var lieky: LiekInfo
//    let homeData = HomeViewModel()
    
    @FocusState var inputActive:Bool
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    let farby : [Color] = [.red, .yellow, .orange, .blue, .green, .purple, .teal, .brown]
    
    @State var farba:Color = .indigo
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                    Form{
                        
                        Section(header: Text("detaily lieku")){
                            TextField("Názov", text: $homeData.nazovLieku)
                            TextField("Počet tabletiek v balení", text: $homeData.pocetTabletiek)
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItem(placement: .keyboard){
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Button("Potvrdiť"){
                                            inputActive = false
                                        }
                                    }
                                }
                            }
                            .focused($inputActive)
                        
                    }
                        
                        Section(header: Text("dávkovanie")) {
                            
                            TextField("Počet tabletiek denne", text: $homeData.tabletiekDenne)
                            Toggle(isOn: $homeData.viacKratDenne.animation()) {
                                Text("Tabletky beriem viackrát denne")
                                    
                            }
                            
                            if homeData.viacKratDenne {
                                NavigationLink(destination: HowManyTimesADayView(homeData: homeData, lieky: lieky)) {
                                    Text("Koľkokrát denne?")
                                }
                            }
                            
                            
                            
                        }
                        
                        Section(){
                            Toggle(isOn: $homeData.upozornovatMaloLiekov.animation()){
                                Text("Upozorňovať na dochádzajúce lieky")
                                
                            
                            }
                            
                            if homeData.upozornovatMaloLiekov{
                                
                                
                                
                                TextField("Počet dní užívania lieku", text: $homeData.pocetDni)
                                    
                                    .keyboardType(.numberPad)
                                    .focused($inputActive)
                                
                                TextField("Počet dní upozornenia vopred", text: $homeData.dniPredMinutim)
                                    
                                    .keyboardType(.numberPad)
                                    .focused($inputActive)
                                
    //                            Tu pôjde picker pre upozornenie N dní pred dojdením liekov + pridať možnosť
    //                            potvrdenia kúpy liekov
                                
                            }
                            
                        }
                        
                        if homeData.upozornovatMaloLiekov{
                            Section(footer: Text("Ak nepovolíte túto možnosť, RemindMe bude dopĺňanie liekov riešiť automaticky akonáhle sa minie vami zadané množstvo tabletiek v balení.")) {
                                Toggle(isOn: $homeData.potvrdzovatDoplnenie.animation()){
                                    Text("Potvrdzovať doplňovanie liekov")
                                    
                                    
                                }
                            }
                        }
                       
                        
                        Section(header: Text("Nastaviť farbu ikonky"), footer: Text("Ak nevyberiete farbu ikonky, RemindMe samo vyberie náhodnú farbu.")){
                            ColorSwatcher(selection: $homeData.farbaIkonky)
                                
                        }
                        
                        
                    }
                        
                    
                    
                    
                    
                    
                }
                
                .navigationTitle("Pridať lieky")
                    .navigationBarTitleDisplayMode(.inline)
                
                    

                    
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            homeData.saveData(context: viewContext, presentation: presentationMode)
                            
                            
                            
                            
                            
                        }, label: {
                            Text("Hotovo")
                        }
                    )}
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Zrušiť")
                        }
                    )}
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(homeData: HomeViewModel(), lieky: LiekInfo())//.preferredColorScheme(.dark)
    }
}
