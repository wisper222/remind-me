//
//  HowManyTimeADayView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI

struct HowManyTimesADayView: View {
    @ObservedObject var homeData : HomeViewModel
    @ObservedObject var lieky: LiekInfo
    var body: some View {
        Form{
            Section(header: Text("Predvolené")) {
                Toggle(isOn: $homeData.ranoCasTrue.animation()){
                    Text("Ráno")
                }
                
                if homeData.ranoCasTrue{
                    
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: homeData.ranoCas)
                        
                        
                    
                }
                
                
            
            
                Toggle(isOn: $homeData.obedCasTrue.animation()){
                    Text("Obed")
                }
                
                if homeData.obedCasTrue{
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: homeData.obedCas)
                        
                }
                
            
            
            
                Toggle(isOn: $homeData.vecerCasTrue.animation()){
                    Text("Večer")
                }
                
                if homeData.vecerCasTrue{
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "V čase", premenna: homeData.vecerCas)
                        
                }
                
            }
            
            Section(header: Text("Vlastné")){
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 1", premenna: homeData.cas1)
                    Toggle(isOn: $homeData.cas1True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 2", premenna: homeData.cas2)
                    Toggle(isOn: $homeData.cas2True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 3", premenna: homeData.cas3)
                    Toggle(isOn: $homeData.cas3True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 4", premenna: homeData.cas4)
                    Toggle(isOn: $homeData.cas4True){
                        Text("")
                    }.frame(width: 80)
                }
                    
                HStack {
                    DatePicker24Hr(homeData: homeData, lieky: lieky, nadpis: "Vlastný čas 5", premenna: homeData.cas5)
                    Toggle(isOn: $homeData.cas5True){
                        Text("")
                    }.frame(width: 80)
                }
                    
            }
            
            
        }
        
    }
}

struct HowManyTimeADayView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyTimesADayView(homeData: HomeViewModel(), lieky: LiekInfo())
    }
}
