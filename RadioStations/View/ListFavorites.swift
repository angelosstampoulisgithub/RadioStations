//
//  ListFavorites.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import SwiftUI
import SwiftData
struct ListFavorites: View {
    @Query private var items: [Item] = []
    var body: some View {
        NavigationStack{
            if items.count > 0 {
                List(items){item in
                    OnlineFavoritesCell(item: item)
                }
            }
        }
    }
}

#Preview {
    ListFavorites()
}
