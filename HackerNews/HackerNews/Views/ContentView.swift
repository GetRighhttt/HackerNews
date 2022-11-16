//
//  ContentView.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                
            }.navigationTitle("Hacker News")
            .background(Color("BrownTint"))
            .foregroundColor(Color("Beige"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
