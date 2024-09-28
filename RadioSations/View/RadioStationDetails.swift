//
//  RadioStationDetails.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI

struct RadioStationDetails: View {
    @Environment(\.modelContext) private var modelContext
    @State var item:RadioStations
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: item.logo)){
                    result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }.frame(width: 100, height: 100)
                Text("Title").frame(width:300,height:15,alignment: .leading)
                Text(item.title).frame(width:300,height:45,alignment: .leading)
                Text("Description").frame(width:300,height:15,alignment: .leading)
                Text(item.description).frame(width:300,height:295,alignment: .leading)
                Text("Streaming url").frame(width:300,height:15,alignment: .leading)
                Text(item.streaming_url).frame(width:300,height:45,alignment: .leading)
                Text("Station id").frame(width:300,height:15,alignment: .leading)
                Text(item.station_id).frame(width:300,height:45,alignment: .leading)
                HStack{
                    Button {
                        let helper = Helper()
                        let favorite = Favorites(station_id: item.station_id, title: item.title, descriptionStation: item.description, logo: item.logo, streaming_url: item.streaming_url, status: item.status, updated: item.updated, ordering: item.ordering)
                        helper.createFavorite(item: favorite, modelContext: modelContext)
                    } label: {
                        Text("Add to Favorites")
                    }.padding()
                        .buttonStyle(PlainButtonStyle())
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(22)
                    
                    NavigationLink {
                        RadioPlayer(isPlaying: false, item: item)
                    } label: {
                        Text("Radio Player")
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
}


