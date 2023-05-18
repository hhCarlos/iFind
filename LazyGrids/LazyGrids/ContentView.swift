//
//  ContentView.swift
//  LazyGrids
//
//  Created by Carlos Enrique Hernandez Hernandez on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    let gridColumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    let gridRows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let colors: [Color] = [.red, .green, .blue, .purple, .pink]
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(0...100, id: \.self) {
                        index in
                        Text("Item \(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridRows, spacing: 20) {
                    ForEach(0...100, id: \.self) {
                        index in
                        Text("Item \(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
