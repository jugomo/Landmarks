//
//  ContentView.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

// https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
