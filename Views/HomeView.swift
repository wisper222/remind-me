//
//  HomeView.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject var homeData = HomeViewModel()
    
    @Environment(\.managedObjectContext) public var viewContext
    @Environment (\.presentationMode) var presentationMode

    @FetchRequest(
        entity: LiekInfo.entity(),
        sortDescriptors: [],
        animation: .default)
    
    private var items: FetchedResults<LiekInfo>
    @State var buttonPressed = false
    @State var welcomeView = false
    
//    var LiekData: LiekInfo
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(items){ lieky in
                    NavigationLink(destination: EditView(homeData: homeData, lieky: lieky)){
                        HStack{
                            Image(systemName: "\(lieky.nazovLieku[0].lowercased()).square.fill")
                                .foregroundColor(Color(lieky.iconColor))
                                
                                
                            Text(lieky.nazovLieku)
                            
                            }
                    }
                    
                }.onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(items[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
     
                }
            }.navigationTitle("Lieky")
            
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        
                                HStack {
                                    
                                    Button(action: {
                                        welcomeView = true
                                    }, label: {
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 100)
                                            .opacity(0)
                                    }).foregroundColor(.black)
                                    
                                        

                                
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        buttonPressed = true
                                    }, label: {
                                        
                                        Label("Pridať", systemImage: "plus.circle")
                                            .labelStyle(.titleAndIcon)
                                })
                                
                                
                                
                            
                            
                        }
                        
                    }
                    
                }
            
        }.sheet(isPresented: $buttonPressed){
            AddView(homeData: homeData, lieky: LiekInfo())
            
        }
        
        .sheet(isPresented: $welcomeView){
            WelcomeView(welcomeView: $welcomeView)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
