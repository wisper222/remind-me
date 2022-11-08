//
//  HomeViewModel.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import Foundation
import CoreData
import SwiftUI

class HomeViewModel : ObservableObject {
    
    let dateFormatter = DateFormatter()
    @Published var dateComponents = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0)
    
    init(){
        dateComponents = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0)
    }
    
    @Published var footerText = ""
    @Published var potvrdzovatDoplnenie = false
    @Published var farbaIkonky = ""
    @Published var dniPredMinutim = ""
    @Published var nazovLieku = ""
    @Published var pocetTabletiek = ""
    @Published var pocetDni = ""
    @Published var tabletiekDenne = ""
    @Published var nKratDenne = ""
    @Published var ranoCas = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var obedCas = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var vecerCas = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas1 = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas2 = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas3 = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas4 = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas5 = DateComponents(calendar: Calendar.current, timeZone: .current, hour: 0, minute: 0).date ?? Date()
    @Published var cas1True = false
    @Published var cas2True = false
    @Published var cas3True = false
    @Published var cas4True = false
    @Published var cas5True = false
    @Published var ranoCasTrue = false
    @Published var obedCasTrue = false
    @Published var vecerCasTrue = false
    @Published var upozornovatMaloLiekov = false
    @Published var viacKratDenne = false
    @Published var id = UUID()
    
//    @Published var LiekContent : LiekInfo!{
//
//    }
  
    func čas(){
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        
        
        
    }
    
    func saveData(context: NSManagedObjectContext, presentation: Binding<PresentationMode>) {
        let newLiek = LiekInfo(context: context)
        newLiek.nazovLieku = nazovLieku
        newLiek.pocetTabletiek = pocetTabletiek
        newLiek.pocetTabletiekPociatocne = pocetTabletiek
        newLiek.pocetDni = pocetDni
        newLiek.tabletiekDenne = tabletiekDenne
        newLiek.nKratDenne = nKratDenne
        newLiek.potvrdzovatDoplnenie = potvrdzovatDoplnenie
        newLiek.upozornovatMaloLiekov = upozornovatMaloLiekov
        newLiek.viacKratDenne = viacKratDenne
        newLiek.iconColor = farbaIkonky
        newLiek.id = UUID()
        if viacKratDenne{
        newLiek.cas1 = cas1
        newLiek.cas2 = cas2
        newLiek.cas3 = cas3
        newLiek.cas4 = cas4
        newLiek.cas5 = cas5
        newLiek.ranoCas = ranoCas
        newLiek.obedCas = obedCas
        newLiek.vecerCas = vecerCas
        newLiek.cas1True = cas1True
        newLiek.cas2True = cas2True
        newLiek.cas3True = cas3True
        newLiek.cas4True = cas4True
        newLiek.cas5True = cas5True
        newLiek.ranoCasTrue = ranoCasTrue
        newLiek.obedCasTrue = obedCasTrue
        newLiek.vecerCasTrue = vecerCasTrue
        }
        
        do{
            try context.save()
            presentation.wrappedValue.dismiss()
        } catch {
            print("error")
        }
    }
    
    func editData(context: NSManagedObjectContext, presentation: Binding<PresentationMode>){
        let staryLiek = LiekInfo(context: context)
        staryLiek.nazovLieku = nazovLieku
        staryLiek.pocetTabletiek = pocetTabletiek
        staryLiek.pocetTabletiekPociatocne = pocetTabletiek
        staryLiek.pocetDni = pocetDni
        staryLiek.tabletiekDenne = tabletiekDenne
        staryLiek.nKratDenne = nKratDenne
        staryLiek.potvrdzovatDoplnenie = potvrdzovatDoplnenie
        staryLiek.upozornovatMaloLiekov = upozornovatMaloLiekov
        staryLiek.viacKratDenne = viacKratDenne
        staryLiek.iconColor = farbaIkonky
        staryLiek.id = UUID()
        if viacKratDenne{
        staryLiek.cas1 = cas1
        staryLiek.cas2 = cas2
        staryLiek.cas3 = cas3
        staryLiek.cas4 = cas4
        staryLiek.cas5 = cas5
        staryLiek.ranoCas = ranoCas
        staryLiek.obedCas = obedCas
        staryLiek.vecerCas = vecerCas
        staryLiek.cas1True = cas1True
        staryLiek.cas2True = cas2True
        staryLiek.cas3True = cas3True
        staryLiek.cas4True = cas4True
        staryLiek.cas5True = cas5True
        staryLiek.ranoCasTrue = ranoCasTrue
        staryLiek.obedCasTrue = obedCasTrue
        staryLiek.vecerCasTrue = vecerCasTrue
        }else if viacKratDenne != true{
            staryLiek.cas1True = false
            staryLiek.cas2True = false
            staryLiek.cas3True = false
            staryLiek.cas4True = false
            staryLiek.cas5True = false
            staryLiek.ranoCasTrue = false
            staryLiek.obedCasTrue = false
            staryLiek.vecerCasTrue = false
        }
        staryLiek.id = id
    }

    func test(value: String?) -> String{
        if value != nil {
            return value!
        } else {
            return pocetDni
        }
    }
    
    func liekyDoplnene(context: NSManagedObjectContext, presentation: Binding<PresentationMode>){
        let staryLiek = LiekInfo(context: context)
        pocetTabletiek = staryLiek.pocetTabletiekPociatocne
        
    }
    
//    func addOpacity(){
//        while opacita <= 1{
//            withAnimation(.easeIn){
//            opacita += 0.5
//            }
//        }
//    }
    
    
}



