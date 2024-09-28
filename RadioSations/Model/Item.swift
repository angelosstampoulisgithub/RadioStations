//
//  Item.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var station_id:String
    var title:String
    var descriptionStation:String
    var logo:String
    var streaming_url:String
    var status:String
    var updated:String
    var ordering:String
    init(station_id: String, title: String, descriptionStation: String, logo: String, streaming_url: String, status: String, updated: String, ordering: String) {
        self.station_id = station_id
        self.title = title
        self.descriptionStation = descriptionStation
        self.logo = logo
        self.streaming_url = streaming_url
        self.status = status
        self.updated = updated
        self.ordering = ordering
    }
}
