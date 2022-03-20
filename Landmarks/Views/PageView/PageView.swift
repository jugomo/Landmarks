//
//  PageView.swift
//  Landmarks
//
//  Created by jugomo on 20/3/22.
//

import SwiftUI

/// custom view to present the UIViewControllerRepresentable view
struct PageView<Page:View>: View {
    var pages: [Page]

    /// is a value that can change over time and affects to the view's behavior
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)

            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 10))
                .padding(.trailing)

            Navigate(numberOfPages: pages.count, currentPage: $currentPage)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map {
            FeatureCard(landmark: $0)
        })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
