//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var selection : Content = .frontPage
//    {
//       Why won't work?
//        didSet {
//            networkManager.fetchData(forContent: selection)
//        }
//    }
//

    var body: some View {
        NavigationStack {
            List() {
                Picker(selection: $selection) {
                    ForEach(Content.allCases) { content in
                        Text(content.rawValue).tag(content)
                    }

                }
            label: {
                Text("Content")
                    .font(.headline)
            }
            .pickerStyle(.segmented)
                
                ForEach(networkManager.posts) { post in
                    
                    NavigationLink {
                        DetailView(url: post.url)
                    } label: {
                        PostRow(forPost: post)
                    }
                    
                    
                }
                
                .navigationTitle("Hacker News")
                .navigationBarTitleDisplayMode(.large)
            }
            .onAppear {
                networkManager.fetchData(forContent: selection)
            }
            .onChange(of: selection) { content in
                networkManager.fetchData(forContent: content)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
