//
//  DetailsView.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    // initialize network manager with observed object
    @ObservedObject var networkManager = NetworkManger()
    
    let url: String?
    
    var body: some View {
        ZStack {
            Color("BrownTint").ignoresSafeArea()
            WebView(urlString: url) // pass in url from webview struct
                .cornerRadius(20)
        }
    }
}


struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com")
    }
}
