//
//  RadioStationDetailsOffline.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 28/9/24.
//

import SwiftUI

struct RadioStationDetailsOffline: View {
    @Environment(\.modelContext) private var modelContext
    @State var item:Item
    var body: some View {
        VStack{
            Image(.oldradio).resizable().frame(width:70,height:65)
            Text("Title").frame(width:300,height:15,alignment: .leading)
            Text(item.title).frame(width:300,height:45,alignment: .leading)
            Text("Description").frame(width:300,height:15,alignment: .leading)
            Text(item.descriptionStation).frame(width:300,height:295,alignment: .leading)
            Text("Streaming url").frame(width:300,height:15,alignment: .leading)
            Text(item.streaming_url).frame(width:300,height:45,alignment: .leading)
            Text("Station id").frame(width:300,height:15,alignment: .leading)
            Text(item.station_id).frame(width:300,height:45,alignment: .leading)
            HStack{
                Button {
                    let helper = Helper()
                    let favorite = Favorites(station_id: item.station_id, title: item.title, descriptionStation: item.descriptionStation, logo: item.logo, streaming_url: item.streaming_url, status: item.status, updated: item.updated, ordering: item.ordering)
                    helper.createFavorite(item: favorite, modelContext: modelContext)
                } label: {
                    Text("Add to Favorites")
                }.padding()
                    .buttonStyle(PlainButtonStyle())
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(22)
            }
        }
    }
}

