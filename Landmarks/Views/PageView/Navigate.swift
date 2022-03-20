//
//  Navigate.swift
//  Landmarks
//
//  Created by jugomo on 20/3/22.
//

import SwiftUI

struct Navigate: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        VStack {
            HStack {
                Button {
                    print("previous")
                    if currentPage != 0 {
                        currentPage -= 1
                    } else {
                        currentPage = numberOfPages - 1
                    }
                } label: {
                    Label("", systemImage: "arrow.left")
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain) // Whenever you have multiple buttons in a list row, you need to manually set the button style to .borderless or .plain. This is because buttons “adapt” to their context.

                Spacer()
                Text("Current: \(currentPage)")
                    .foregroundColor(.white)
                Spacer()

                Button {
                    print("next")
                    if currentPage < numberOfPages - 1 {
                        currentPage += 1
                    } else {
                        currentPage = 0
                    }
                } label: {
                    Label("", systemImage: "arrow.right")
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain) // Whenever you have multiple buttons in a list row, you need to manually set the button style to .borderless or .plain. This is because buttons “adapt” to their context.
            }
            .padding()
            .background(Color(red: 0xAA / 255, green: 0xAA / 255, blue: 0xAA / 255, opacity: 0.1))

            Spacer()
        }
    }
}

struct Navigate_Previews: PreviewProvider {
    @State static var currentPage = 1

    static var previews: some View {
        Navigate(numberOfPages: 3, currentPage: $currentPage)
    }
}
