//
//  ContentView.swift
//  iFind
//
//  Created by Carlos Enrique Hernandez Hernandez on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var artista = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Write your favorite artist", text: $artista)
                }
                
                Section {
                    NavigationLink {
                        MusicListView(artista: artista)
                    } label: {
                        Text("Find")
                    }
                }
                .disabled(artista.isEmpty)
            }
            .navigationTitle("iFind Music")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
