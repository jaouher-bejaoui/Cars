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
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                phase.image?.resizable()
                    .scaledToFit()
            default:
                Image(systemName: "photo")
                    .frame(maxWidth: .infinity)
            }
        }
        .clipShape(.rect(cornerRadius: ViewSizes.small.rawValue))
    }
}

#Preview {
    GenericImageView(urlString: "https://www.google.c")
}

