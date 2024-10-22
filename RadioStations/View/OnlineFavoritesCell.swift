//
//  OnlineFavoritesCell.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import SwiftUI

struct OnlineFavoritesCell: View {
    @State var item:Item
    let columns = [
        GridItem(.fixed(160)),
        GridItem(.fixed(160))
    ]
    var body: some View {
            LazyVGrid(columns: columns,spacing:32) {
                HStack{
                    HStack{
                        AsyncImage(url: URL(string: item.logo)){ result in
                            result.image?
                                .resizable()
                                .frame(width:50,height:50,alignment: .leading)
                                .scaledToFit()
                        }.frame(width:50,height:150,alignment: .leading)
                        Text(item.title)
                    }.frame(width:210,height:65,alignment: .leading)
                }.frame(width:150,height:65,alignment: .leading)
            }
        }
}
