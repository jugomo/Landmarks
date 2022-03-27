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
        #if os(iOS)
        image.overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .clipShape(Circle())
            .shadow(radius: 7)
        #else
            if #available(macOS 12.0, *) {
                image.overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .clipShape(Circle())
                    .shadow(radius: 7)
            } else {
                image.clipShape(Circle())
                    .shadow(radius: 7)
            }
        #endif
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("malaga"))
    }
}
