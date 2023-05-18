//
//  ContentView.swift
//  ScrollViewReaders
//
//  Created by Carlos Enrique Hernandez Hernandez on 17/05/23.
//

import SwiftUI

struct LetterItem: Identifiable {
    let id: Int
    let name: String
}

struct ContentView: View {
    let letters: [LetterItem] = [
        LetterItem(id: 0, name: "a.circle.fill"),
        LetterItem(id: 1, name: "b.circle.fill"),
        LetterItem(id: 2, name: "c.circle.fill"),
        LetterItem(id: 3, name: "d.circle.fill"),
        LetterItem(id: 4, name: "e.circle.fill"),
        LetterItem(id: 5, name: "f.circle.fill"),
        LetterItem(id: 6, name: "g.circle.fill"),
        LetterItem(id: 7, name: "h.circle.fill"),
        LetterItem(id: 8, name: "i.circle.fill"),
        LetterItem(id: 9, name: "j.circle.fill"),
        LetterItem(id: 10, name: "k.circle.fill"),
        LetterItem(id: 11, name: "l.circle.fill"),
        LetterItem(id: 12, name: "m.circle.fill"),
        LetterItem(id: 13, name: "n.circle.fill"),
        LetterItem(id: 14, name: "o.circle.fill"),
        LetterItem(id: 15, name: "p.circle.fill"),
        LetterItem(id: 16, name: "q.circle.fill")
    ]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Go to letter Q") {
                    value.scrollTo(16, anchor: .center)
                }
                .padding()
                
                ForEach(letters) { letter in
                    Image(systemName: letter.name)
                        .id(letter.id)
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .frame(width: 90, height: 90)
                        .background(.blue)
                        .padding()
                }
                
                Button("Go to letter G") {
                    value.scrollTo(6, anchor: .center)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
