//
//  ContentView.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var offlineList:[OfflineItem]
    @EnvironmentObject var viewModel:ViewModel
    @Environment(NetworkMonitor.self) private var networkMonitor
    @State var offlineItem:OfflineItem;
    var body: some View {
        TabView{
            if networkMonitor.isConnected{
                NavigationStack{
                    List(viewModel.radiostations  ){item in
                            OnlineCell(item: item)
                    }.task{
                            do{
                                try await viewModel.getAllRadioStations()
                                let helper = Helper(modelContext: modelContext)
                                helper.createList(viewModel: viewModel)
                            }catch{
                                debugPrint("something went wrong!!!")
                            }
                    }
                }
                .tabItem {
                    Text("List Radio Stations")
                }
                ListFavorites()
                .tabItem {
                    Text("Favorites")
                }
            }else{
                NavigationStack{
                    List(offlineList){item in
                        OfflineCell(item: item)
                    }
                }
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

   

  
}

#Preview {
    ContentView(offlineItem: .init(title: "", logo: ""))
        .modelContainer(for: Item.self, inMemory: true)
}
