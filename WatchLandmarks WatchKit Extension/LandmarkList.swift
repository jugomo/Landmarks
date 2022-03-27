//
//  LandmarkList.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by jugomo on 27/3/22.
//

import SwiftUI

struct LandmarkList: View {
    /// this property gets its value automatically
    @EnvironmentObject var modelData: ModelData

    /// is a value that can change over time and affects to the view's behavior
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favourites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkList()
                .environmentObject(ModelData())
        }
    }
}
