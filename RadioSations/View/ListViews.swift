//
//  ListViews.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 28/9/24.
//

import SwiftUI

struct ListViews: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var viewModel:ViewModel
    @Environment(NetworkMonitor.self) private var newtworkMonitor
    var body: some View {
        if newtworkMonitor.isConnected{
            OnLineListView(searchText: "")
        }else{
            OffLineListView()
        }
    }
}

