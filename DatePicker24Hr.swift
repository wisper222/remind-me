//
//  DatePicker24Hr.swift
//  RemindMe2
//
//  Created by Alex Garay on 21/10/2021.
//

import SwiftUI

struct DatePicker24Hr: View {
    @ObservedObject var homeData: HomeViewModel
    @ObservedObject var lieky: LiekInfo
    @State var nadpis:String = ""
    @State var premenna:Date = Date()
    @State var components:DatePickerComponents = .hourAndMinute
    var body: some View {
        DatePicker(nadpis, selection: $premenna, displayedComponents: components)
            .environment(\.locale, Locale(identifier: "sk_SK"))
    }
}

struct DatePicker24Hr_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker24Hr(homeData: HomeViewModel(), lieky: LiekInfo())
    }
}
