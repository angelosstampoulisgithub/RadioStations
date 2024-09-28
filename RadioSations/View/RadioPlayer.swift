//
//  RadioPlayer.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI
import AVKit
struct RadioPlayer: View {
    @State var player:AVPlayer?
    @State var isPlaying:Bool
    @State var item:RadioStations
    var body: some View {
        NavigationStack{
            VStack{
                if isPlaying{
                    Image("onair").resizable()
                        .frame(maxHeight:.infinity,alignment:.center)
                }
                else{
                    Image("oldradio")
                        .resizable()
                        .frame(maxHeight:.infinity,alignment:.center)
                }
                Button {
                    isPlaying.toggle()
                    if isPlaying{
                        player?.play()
                    }else{
                        player?.pause()
                    }
                } label: {
                    Color.red.overlay {
                        Image(isPlaying ? "pause" : "play").resizable()
                    }.frame(width:50,height:50)
                }
                .frame(width:300,height:300)
                .background {
                    Ellipse().clipShape(.circle)
                        .frame(width:100,height:100)
                        .foregroundStyle(.red)
                }.frame(maxHeight:.infinity,alignment:.bottom)
            }.navigationTitle("Radio Player")
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            if item.streaming_url.count > 0 {
                guard let playerUrl = URL(string:item.streaming_url) else{
                    return
                }
                player = AVPlayer(url: playerUrl)
            }
        }.background {
            Color.black
        }.onDisappear {
            if item.streaming_url.count > 0 {
                player?.pause()
            }
        }
    }
}


