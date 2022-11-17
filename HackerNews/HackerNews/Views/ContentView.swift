//
//  ContentView.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    // initialize network manager with observed object
    @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView {
            ZStack {
                // closure extended out
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailsView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                                .padding(.trailing, 10)
                            Text(post.title)
                                .padding(.top, 5)
                        }
                    }
                    .listRowBackground(Color("BrownTint"))
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetGroupedListStyle())
                }
                .navigationTitle("Hacker News")
            }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
