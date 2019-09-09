//
//  CircleImage.swift
//  CombineViews
//
//  Created by julio on 08/09/2019.
//  Copyright © 2019 julio. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("indice")
        .frame(width: 120, height: 120, alignment: .center)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
