//
//  Helper.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
import SwiftData
@MainActor
class Helper{
    func createList(viewModel:ViewModel,modelContext:ModelContext){
        let descriptor = FetchDescriptor<Item>(predicate: #Predicate { $0.title.isEmpty != true })
        guard let count = (try? modelContext.fetchCount(descriptor)) else{
            return
        }
        if count > 0 {
            do {
                try modelContext.delete(model: Item.self)
                try modelContext.save()
            } catch {
                print("Failed to clear all RadioStations")
            }
            
            do{
                for radio in viewModel.radiostations{
                    let item = Item(station_id: radio.station_id, title: radio.title, descriptionStation: radio.description, logo: radio.logo, streaming_url: radio.streaming_url, status: radio.status, updated: radio.updated, ordering: radio.ordering)
                    modelContext.insert(item)
                }
                try modelContext.save()
            }catch{
                debugPrint("something went wrong!!!!!")
            }
        }else{
            do{
                for radio in viewModel.radiostations{
                    let item = Item(station_id: radio.station_id, title: radio.title, descriptionStation: radio.description, logo: radio.logo, streaming_url: radio.streaming_url, status: radio.status, updated: radio.updated, ordering: radio.ordering)
                    modelContext.insert(item)
                }
                try modelContext.save()
            }catch{
                debugPrint("something went wrong!!!!!")
            }
        }
        
    }
    func createFavorite(item:Favorites,modelContext:ModelContext){
        do{
            modelContext.insert(item)
            try modelContext.save()
        }
        catch{
            debugPrint("something went wrong!!!!!")
        }
    }
    
}
