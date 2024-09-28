//
//  ListOfflineFavorites.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 28/9/24.
//

import SwiftUI
import SwiftData
struct ListOfflineFavorites: View {
    @Query var filteredRadioStations:[Favorites]
    var body: some View {
        List(filteredRadioStations){item in
           OfflineCellFavorite(item: item)
        }.navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}


