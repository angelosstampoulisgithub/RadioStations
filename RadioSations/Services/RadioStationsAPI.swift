//
//  RadioStationsAPI.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
import Alamofire
actor RadioStationsAPI{
    let url:URL
    init(url: URL) {
        self.url = url
    }
    func fetchRadioStations() async throws -> [RadioStations]{
        let (data, _) = try await URLSession.shared.data(from: self.url)
        return try JSONDecoder().decode([RadioStations].self, from: data)
    }
}
