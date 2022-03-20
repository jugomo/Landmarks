//
//  CircleImage.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable(resizingMode: .stretch)
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .shadow(radius: 7)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("malaga"))
    }
}
