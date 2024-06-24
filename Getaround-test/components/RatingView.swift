//
//  RatingView.swift
//  Getaround-test
//
//  Created by Jaouher  on 21/06/2024.
//

import SwiftUI

struct RatingView: View {
    var isFullRatingView: Bool
    let average: Double
    let count: Int
    
    init(isFullRatingView: Bool, average: Double, count: Int) {
        self.isFullRatingView = isFullRatingView
        self.average = average
        self.count = count
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if isFullRatingView {
                ForEach(0..<5) { index in
                    Image(systemName: imageName(for: index, value: average).0)
                        .foregroundColor(imageName(for: index, value: average).1)
                }
                .foregroundColor(.yellow)
            } else {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Text(String(format:"%.1f", average))
            Text("(\(count))")
        }
        .minimumScaleFactor(0.5)
        .cornerRadius(8)
        .scaledToFit()
        .frame(width: .infinity)
    }
    
    func imageName(for starIndex: Int, value: Double) -> (String, Color) {
        if value >= Double(starIndex + 1) {
            return ("star.fill", .yellow)
        }
        else if value >= Double(starIndex) + 0.5 {
            return ("star.leadinghalf.filled", .yellow)
        }
        else {
            return ("star.fill", .gray.opacity(0.3))
        }
    }
}

#Preview {
    RatingView(isFullRatingView: true, average: 2.9, count: 58)
}
