//
//  RadioStations.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
class RadioStations:Decodable,Identifiable{
    let station_id:String
    let title:String
    let description:String
    let logo:String
    let streaming_url:String
    let status:String
    let updated:String
    let ordering:String
    enum CodingKeys: String, CodingKey {
      case station_id = "station_id"
      case title = "title"
      case description = "description"
      case logo = "logo"
      case streaming_url = "streaming_url"
      case status = "status"
      case updated = "updated"
      case ordering = "ordering"
    }
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.station_id = try container.decode(String.self, forKey: .station_id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.streaming_url = try container.decode(String.self, forKey: .streaming_url)
        self.status = try container.decode(String.self, forKey: .status)
        self.updated = try container.decode(String.self, forKey: .updated)
        self.ordering = try container.decode(String.self, forKey: .ordering)
    }
}
