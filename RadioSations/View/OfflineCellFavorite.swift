//
//  OfflineCellFavorite.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 28/9/24.
//

import SwiftUI

struct OfflineCellFavorite: View {
    @State var item:Favorites
    let columns = [
        GridItem(.fixed(160)),
        GridItem(.fixed(160))
    ]
    var body: some View {
        LazyVGrid(columns: columns,spacing:32) {
            VStack{
                Image(.oldradio).resizable()
                    .frame(width: 50, height: 50).padding(45)
                Text(item.title).frame(width:150,height:45,alignment: .center)
            }
            VStack{
                ScrollView(.horizontal){
                    Text(item.descriptionStation).frame(width:300,height:300)
                }
            }
        }
    }
}

