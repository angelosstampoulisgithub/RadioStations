//
//  ViewModel.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
@MainActor
class ViewModel:ObservableObject{
    @Published var radiostations: [RadioStations] = []
    let radioServices: RadioStationsAPI
    init(radioServices: RadioStationsAPI) {
        self.radioServices = radioServices
    }
    func getAllRadioStations() async throws{
        self.radiostations = try await radioServices.fetchRadioStations()
    }
}
