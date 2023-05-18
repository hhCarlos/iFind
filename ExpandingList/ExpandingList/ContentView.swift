//
//  ContentView.swift
//  ExpandingList
//
//  Created by Carlos Enrique Hernandez Hernandez on 17/05/23.
//

import SwiftUI

struct BackPack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [BackPack]?
}

struct ContentView: View {
    let backpackContent: [BackPack] = [
        BackPack(
            name: "Currencies",
            icon: "pencil.circle",
            content: [
                BackPack(name: "Dollar", icon: "pencil.circle"),
                BackPack(name: "Peso", icon: "pencil.circle"),
                BackPack(name: "Yen", icon: "pencil.circle")
            ]
        ),
        BackPack(
            name: "Perros y Gatos",
            icon: "pencil.circle",
            content: [
                BackPack(
                    name: "Perros",
                    icon: "pencil.circle",
                    content: [
                        BackPack(name: "Kora", icon: "pencil.circle"),
                        BackPack(name: "Astro", icon: "pencil.circle"),
                        BackPack(name: "Baison", icon: "pencil.circle"),
                        BackPack(name: "Villian", icon: "pencil.circle")
                    ]
                ),
                BackPack(
                    name: "Gatos",
                    icon: "pencil.circle",
                    content: [
                        BackPack(name: "Carlos", icon: "pencil.circle"),
                        BackPack(name: "Mikasa", icon: "pencil.circle")
                    ]
                )
            ]
        )
    ]
    
    var body: some View {
        List(backpackContent,  children: \.content) { backpack in
            Image(systemName: backpack.icon)
            Text(backpack.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
