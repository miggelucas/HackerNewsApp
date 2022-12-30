//
//  Content.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 29/12/22.
//

import Foundation

enum Content : String, CaseIterable, Identifiable {
    case frontPage = "Front Page"
    case LastStories = "Last Stories"
    var id: Self { self }
}
