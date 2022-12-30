//
//  WebView.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {

    let urlString : String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeString = urlString else { return }
        
        guard let safeURL = URL(string: safeString) else { return }
        
        let request = URLRequest(url: safeURL)
        uiView.load(request)
    }
}

