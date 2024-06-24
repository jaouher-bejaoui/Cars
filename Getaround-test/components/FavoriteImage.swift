//
//  FavoriteImage.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import SwiftUI

struct FavoriteImage: View {
    var isLiked: Bool
    
    init(isLiked: Bool) {
        self.isLiked = isLiked
    }
    
    var body: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(getImageColor())
            .font(.system(size: 20))
    }
}

extension FavoriteImage {
    func getImageColor() -> Color {
        isLiked ? .purple : .gray
    }
}

#Preview {
    FavoriteImage(isLiked: false)
}
