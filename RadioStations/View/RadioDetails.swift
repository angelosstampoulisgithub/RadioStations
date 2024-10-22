//
//  RadioDetails.swift
//  RadioStations
//
//  Created by Angelos Staboulis on 22/10/24.
//

import SwiftUI

struct RadioDetails: View {
    var item:RadioStations
    @Environment(\.modelContext) private var modelContext

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
                            withAnimation {
                                let createItem = Item( title: item.title,logo: item.logo)
                                modelContext.insert(createItem)
                                modelContext.autosaveEnabled = true
                            }
                        
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


