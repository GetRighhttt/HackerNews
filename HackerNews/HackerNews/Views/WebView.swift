//
//  WebView.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import Foundation
import SwiftUI
import WebKit

/*
 Need a struct for the webview.
 UIRepresentable allows us to create a custom view from UI kit.
 
 */
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    /*
     Have to create two delegate(overriden) methods to get rid of erros.
     
     The first method just returns the view.
     */
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    /*
     Method to update ui based on representable view.
     */
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
