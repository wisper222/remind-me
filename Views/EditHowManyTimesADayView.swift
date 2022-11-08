//
//  EditHowManyTimesADayView.swift
//  RemindMe2
//
//  Created by Alex Garay on 19/10/2021.
//

import SwiftUI

struct EditHowManyTimesADayView: View {
    @Environment(\.managedObjectContext) var  viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var homeData : HomeViewModel
    @ObservedObject var lieky: LiekInfo
    var body: some View {
        Form{
            Section(header: Text("Predvolené")) {
                Toggle(isOn: $lieky.ranoCasTrue.animation()){
                    Text("Ráno")
                }
                
                if lieky.ranoCasTrue{
                    
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: lieky.ranoCas)
                        
                        
                    
                }
                
                
            
            
                Toggle(isOn: $lieky.obedCasTrue.animation()){
                    Text("Obed")
                }
                
                if lieky.obedCasTrue{
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: lieky.obedCas)
                        
                }
                
            
            
            
                Toggle(isOn: $lieky.vecerCasTrue.animation()){
                    Text("Večer")
                }
                
                if lieky.vecerCasTrue{
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: lieky.vecerCas)
                        
                }
                
            }
            
            Section(header: Text("Vlastné")){
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 1", premenna: homeData.cas1)
                    Toggle(isOn: $lieky.cas1True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 2", premenna: homeData.cas2)
                    Toggle(isOn: $lieky.cas2True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 3", premenna: homeData.cas3)
                    Toggle(isOn: $lieky.cas3True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 4", premenna: homeData.cas4)
                    Toggle(isOn: $lieky.cas4True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 5", premenna: homeData.cas5)
                    Toggle(isOn: $lieky.cas5True){
                        Text("")
                    }.frame(width: 80)
                }
                    
            }
            
            
        }
    }
}

struct EditHowManyTimesADayView_Previews: PreviewProvider {
    static var previews: some View {
        EditHowManyTimesADayView(homeData: HomeViewModel(), lieky: LiekInfo())
    }
}
