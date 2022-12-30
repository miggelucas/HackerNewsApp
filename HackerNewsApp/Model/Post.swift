//
//  Post.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import Foundation

struct Post : Codable, Identifiable{
    var id : Int {
        Int(objectID)!
    }
    
    var pointsString : String {
        String(points)
    }
    
    let objectID : String
    let points : Int
    let title : String
    let url : String?
    let author : String
    
}
