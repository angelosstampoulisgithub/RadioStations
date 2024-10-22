//
//  Item.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title:String
    var logo:String
    init(title: String, logo: String) {
        self.title = title
        self.logo = logo
    }
}
