//
//  GenericImageView.swift
//  Getaround-test
//
//  Created by Jaouher  on 21/06/2024.
//

import SwiftUI

struct GenericImageView: View {
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
                .scaledToFit()
                
        } placeholder: {
            ProgressView()
        }
        .clipShape(.rect(cornerRadius: 8))
    }
}
