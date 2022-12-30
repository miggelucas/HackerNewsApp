//
//  NetworkManager.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import Foundation


class NetworkManager : ObservableObject {
    @Published var posts = [Post]()
    
    func fetchURL(forContent content : Content) -> URL? {
        switch content {
        case .frontPage:
            return URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        case .LastStories:
            return URL(string: "http://hn.algolia.com/api/v1/search_by_date?tags=story")
        }
    }
    
    func fetchData(forContent content : Content) {
        
        guard let url = fetchURL(forContent: content) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self , from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                        
                        
                    } catch {
                        print(error)
                    }
                }
                
            }
        }
        
        task.resume()
        
    }
}
