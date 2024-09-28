//
//  ContentView.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State var container:ModelContainer
    @EnvironmentObject var viewModel:ViewModel
    @Environment(NetworkMonitor.self) private var newtworkMonitor
    var body: some View {
        TabView{
                ListViews()
                .tabItem {
                    Text("List Radio Stations")
                }
                ListFavorites()
                .tabItem {
                    Text("Favorites")
                }
        }
        
    }

}

