//
//  OffLineListView.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI
import SwiftData
struct OffLineListView: View {
    @Query var filteredRadioStations:[Item]
    var body: some View {
        NavigationStack {
            List(filteredRadioStations){item in
                OffLineCell(item: item)
            }.navigationTitle("List RadioStations")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

