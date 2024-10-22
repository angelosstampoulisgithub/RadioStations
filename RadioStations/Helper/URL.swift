//
//  URL.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import Foundation
extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}
