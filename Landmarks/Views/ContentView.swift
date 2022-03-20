//
//  ContentView.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

// https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

struct ContentView: View {
    /// is a value that can change over time and affects to the view's behavior
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tag(Tab.featured)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }

            LandmarkList()
                .tag(Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
