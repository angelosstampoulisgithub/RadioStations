//
//  ListFavorites.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 28/9/24.
//

import SwiftUI
import SwiftData
struct ListFavorites: View {
    @Environment(NetworkMonitor.self) private var newtworkMonitor
    var body: some View {
        NavigationStack{
            VStack{
                if newtworkMonitor.isConnected{
                    ListOnlineFavorites()
                }else{
                    ListOfflineFavorites()
                }
            }
        }
    }
}

