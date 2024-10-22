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
    private var modelContext:ModelContext
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    func createBoolean(value:String)->Bool{
        var returnValue = Bool()
        if value == "1"{
            returnValue = true
        }else{
            returnValue = false
        }
        return returnValue
    }
    func createList(viewModel:ViewModel){
        let descriptor = FetchDescriptor<OfflineItem>(predicate: #Predicate { $0.title.isEmpty != true })
        guard let count = (try? modelContext.fetchCount(descriptor)) else{
            return
        }
        if count > 0 {
            do {
                try modelContext.delete(model: OfflineItem.self)
                try modelContext.save()
            } catch {
                print("Failed to clear all RadioStations")
            }
            for radio in viewModel.radiostations{
                let item = OfflineItem(title: radio.title,logo: radio.logo)
                modelContext.insert(item)

            }
            do{
                try self.modelContext.save()
            }catch{
                debugPrint("something went wrong!!!!!")
            }
        }else{
            for radio in viewModel.radiostations{
                let item = OfflineItem(title: radio.title,logo: radio.logo)
                modelContext.insert(item)
            }
            do{
                try self.modelContext.save()
            }catch{
                debugPrint("something went wrong!!!!!")
            }
        }
    }
    
}
