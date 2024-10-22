//
//  OfflineCell.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import SwiftUI

struct OfflineCell: View {
    @State var item:OfflineItem
    let columns = [
        GridItem(.fixed(160)),
        GridItem(.fixed(160))
    ]
    var body: some View {
        LazyVGrid(columns: columns,spacing:32) {
            HStack{
                Image(.oldradio).resizable()
                    .frame(width: 50, height: 50).padding(45)
                Text(item.title)
            }.frame(width:250,height:65,alignment: .leading)
          }.frame(width:230,height:65,alignment: .leading)
    }
}

