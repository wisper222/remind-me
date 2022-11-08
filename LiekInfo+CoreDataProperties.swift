//
//  LiekInfo+CoreDataProperties.swift
//  RemindMe2
//
//  Created by Alex Garay on 20/10/2021.
//
//

import Foundation
import CoreData


extension LiekInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LiekInfo> {
        return NSFetchRequest<LiekInfo>(entityName: "LiekInfo")
    }

    @NSManaged public var cas1: Date
    @NSManaged public var cas1True: Bool
    @NSManaged public var cas2: Date
    @NSManaged public var cas2True: Bool
    @NSManaged public var cas3: Date
    @NSManaged public var cas3True: Bool
    @NSManaged public var cas4: Date
    @NSManaged public var cas4True: Bool
    @NSManaged public var cas5: Date
    @NSManaged public var cas5True: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var nazovLieku: String
    @NSManaged public var nKratDenne: String
    @NSManaged public var obedCas: Date
    @NSManaged public var obedCasTrue: Bool
    @NSManaged public var pocetDni: String
    @NSManaged public var pocetTabletiek: String
    @NSManaged public var ranoCas: Date
    @NSManaged public var ranoCasTrue: Bool
    @NSManaged public var tabletiekDenne: String
    @NSManaged public var upozornovatMaloLiekov: Bool
    @NSManaged public var vecerCas: Date
    @NSManaged public var vecerCasTrue: Bool
    @NSManaged public var viacKratDenne: Bool
    @NSManaged public var iconColor: String
    @NSManaged public var potvrdzovatDoplnenie: Bool
    @NSManaged public var pocetTabletiekPociatocne: String

}

extension LiekInfo : Identifiable {

}
