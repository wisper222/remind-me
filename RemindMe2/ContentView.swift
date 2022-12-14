//
//  ContentView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    

    var body: some View {
        HomeView()
        }
    }



private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
