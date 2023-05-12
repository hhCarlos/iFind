//
//  MusicListView.swift
//  iFind
//
//  Created by Carlos Enrique Hernandez Hernandez on 11/05/23.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct MusicListView: View {
    @State var artista = ""
    @State var songs = [Result]()
    
    var body: some View {
        
        VStack {
            if songs.isEmpty {
                VStack {
                    ProgressView()
                }
                .padding()
            } else {
                List(songs, id: \.trackId) { item in
                    VStack(alignment: .leading) {
                        Text("\(item.trackName)")
                            .font(.headline)
                        
                        Text(item.collectionName)
                    }
                }
            }
        } .task {
            await loadSongs()
        }
        .navigationTitle(artista)
    }
    
    func loadSongs() async {
        print(artista)
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(artista.lowercased().replacingOccurrences(of: " ", with: "+"))&entity=song") else {
            print("Invalid URL!")
            
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data) {
                songs = decodeResponse.results
                
                print(songs)
            }
        } catch {
            print("Invalid data!")
        }
    }
}

struct MusicListView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView(artista: "Mac Miller")
    }
}
