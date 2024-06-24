//
//  CarImageView.swift
//  Getaround-test
//
//  Created by Jaouher  on 21/06/2024.
//

import SwiftUI

struct CarImageView: View {
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: .infinity, height: 200)
        .clipShape(.rect(cornerRadius: 4))
    }
}
