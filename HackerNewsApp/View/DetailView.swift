//
//  DetailView.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}


