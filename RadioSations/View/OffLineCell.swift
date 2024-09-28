//
//  OffLineCell.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI

struct OffLineCell: View {
    @State var item:Item
    let columns = [
        GridItem(.fixed(160)),
        GridItem(.fixed(160))
    ]
    var body: some View {
        LazyVGrid(columns: columns,spacing:32) {
            HStack{
                HStack{
                    Image(.oldradio).resizable()
                        .frame(width: 50, height: 50).padding(45)
                    Text(item.title)
                }.frame(width:250,height:65,alignment: .leading)
                HStack{
                    NavigationLink {
                       RadioStationDetailsOffline(item: item)
                    } label: {
                        Text("Details")
                    }.padding(15)
                        .buttonStyle(PlainButtonStyle())
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(22)
                        .frame(width:120,height:65,alignment: .center)
                }.frame(width:120,height:65,alignment: .center)
            }.frame(width:230,height:65,alignment: .leading)
        }
    }
}

