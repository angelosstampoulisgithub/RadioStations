//
//  OnLineListView.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI
import SwiftData
struct OnLineListView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var viewModel:ViewModel
    var filteredRadioStations: [RadioStations] {
            if searchText.isEmpty {
                return viewModel.radiostations
            } else {
                return viewModel.radiostations.filter{$0.title.localizedCaseInsensitiveContains(searchText) }
            }
    }
    @State var searchText:String
    let helper = Helper()
    var body: some View {
        NavigationStack {
            List(filteredRadioStations){item in
               OnlineCell(item: item)
            }.navigationTitle("List RadioStations")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(text: $searchText)
        .task{
            do{
                try await viewModel.getAllRadioStations()
                helper.createList(viewModel: viewModel, modelContext: modelContext)
            }catch{
                debugPrint("something went wrong!!!")
            }
        }
    }
}
