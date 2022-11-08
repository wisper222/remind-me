//
//  EditView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) var  viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var homeData : HomeViewModel
    @ObservedObject var lieky: LiekInfo
    
    @FetchRequest(
        entity: LiekInfo.entity(),
        sortDescriptors: [],
        animation: .default)
  
    
        private var items: FetchedResults<LiekInfo>
//    @State var test = lieky.pocetDni != nil ? lieky.pocetDni : homeData.pocetDni
    
//    @State var menolieku: String
//    init (menolieku: String){
//        self.menolieku = homeData.nazovLieku
//    }
    @FocusState var inputActive:Bool
    var body: some View {

        
        
            VStack {
                    Form{
                        
                        Section(header: Text("detaily lieku")){
                            TextField("Názov", text: $lieky.nazovLieku)
                            TextField("Počet tabletiek v balení", text: $lieky.pocetTabletiek)
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
                            TextField("Počet tabletiek denne", text: $lieky.tabletiekDenne)
                            Toggle(isOn: $lieky.viacKratDenne.animation()) {
                                Text("Tabletky beriem viackrát denne")
                                    
                            }
                            
                            if lieky.viacKratDenne {
                                NavigationLink(destination: EditHowManyTimesADayView(homeData: homeData, lieky: lieky)) {
                                    Text("Koľkokrát denne?")
                                }
                            }
                            
                            
                            
                        }
                        
                        
                        
                        Section(){
                            Toggle(isOn: $lieky.upozornovatMaloLiekov.animation()){
                                Text("Upozorňovať na dochádzajúce lieky")
                                
                            
                            }
                            
                            if lieky.upozornovatMaloLiekov{
                                
                                TextField("Počet dní užívania lieku", text: $lieky.pocetDni)
                                    
                                    .keyboardType(.numberPad)
                                    .focused($inputActive)
                                
                                TextField("Počet dní upozornenia vopred", text: $homeData.dniPredMinutim)
                                    
                                    .keyboardType(.numberPad)
                                    .focused($inputActive)
                                    
                                
                                
                            }
                            
                        }
                        if lieky.upozornovatMaloLiekov{
                            Section(footer: Text("Ak nepovolíte túto možnosť, RemindMe bude dopĺňanie liekov riešiť automaticky akonáhle sa minie vami zadané množstvo tabletiek v balení.")) {
                                Toggle(isOn: $lieky.potvrdzovatDoplnenie.animation()){
                                    Text("Potvrdzovať doplňovanie liekov")
                                    
                                    
                                }
                            }
                            
                            if lieky.potvrdzovatDoplnenie{
                                
                                    Button(action: {
                                        lieky.pocetTabletiek = lieky.pocetTabletiekPociatocne
                                    }, label: {
                                        Text("Doplniť lieky")
                                    })
                                    
                                    
                                
                            }
    
                        }
                        
                        Section(header: Text("Nastaviť farbu ikonky")){
                            ColorSwatcher(selection: $lieky.iconColor)
                                
                        }
                        
                    }
                        
                    
                    
                    
                    
                    
                }
                
            .navigationBarTitle("Upraviť", displayMode: .inline)
                   
                    .ignoresSafeArea()
                
                    

                    
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            do{
                                try viewContext.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("error")
                            }
                            
                            
                            
                            
                            
                        }, label: {
                            Text("Hotovo")
                        }
                    )}
                }
                
         }
    }

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
//        let homeData = HomeViewModel()
        EditView(homeData: HomeViewModel(), lieky: LiekInfo())
    }
}
