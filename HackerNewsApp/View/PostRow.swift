//
//  PostRow.swift
//  HackerNewsApp
//
//  Created by Lucas Migge de Barros on 27/12/22.
//

import SwiftUI

struct PostRow: View {
    var forPost : Post

    var body: some View {
        HStack {            
            Text(forPost.pointsString)
            VStack(alignment: .leading) {
                Text(forPost.title)
                Text(forPost.author)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var post =
    Post(objectID: "34139048", points: 707, title: "How to Befriend Crows", url: Optional("https://fediscience.org/@ct_bergstrom/109571409346371116"), author: "karmanyaahm")

    
    static var previews: some View {
        PostRow(forPost: post)
            .previewLayout(.sizeThatFits)
    }
}
