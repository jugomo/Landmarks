//
//  FavouriteButton.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

struct FavouriteButton: View {
    /// because use binding, changes made in this view is propagate back to the data source
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" :	 "star")
                .labelStyle(.iconOnly) // title not shown but useful for the voiceover
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(isSet: .constant(true))
    }
}
