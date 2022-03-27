//
//  LandmarkList.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

struct LandmarkList: View {
    /// this property gets its value automatically
    @EnvironmentObject var modelData: ModelData

    // @State are values that can change over time and affects to the view's behavior

    /// state variable for filter to display favorites only
    @State private var showFavoritesOnly = false

    /// state variable for filter to display items of a category
    @State private var categoryFilter = FilterCategory.all

    /// state variable for the selected landmark
    @State private var selectedLandmark: Landmark?


    // MARK: - structs -

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        case technology = "Technology"

        var id: FilterCategory { self }
    }


    // MARK: - Computed properties -

    /// with the filtetered array stored in the view, the user can open multiple windows and have data filtered in different way on each
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (categoryFilter == .all) || categoryFilter.rawValue == landmark.category.rawValue
        }
    }

    var title: String {
        let title = categoryFilter == .all ? "Landmarks" : categoryFilter.rawValue
        return showFavoritesOnly ? "Favourite \(title)" : title
    }

    var selectedLandmarkIndex: Int? {
        let index = modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
//        print("INDICE: \(index)")
//        print("selectedLandmark: \(selectedLandmark?.name)")
        return index
    }

    var hola: String {
        @FocusedValue(\.selectedLandmark) var note
        return note?.name.wrappedValue ?? "-"
    }


    // MARK: - Main View -

    var body: some View {

//        Text("Name:   \(selectedLandmark?.name ?? "")")
//        Text("Indice: \(selectedLandmarkIndex ?? 0)")
//        Text("Object: \(modelData.landmarks[selectedLandmarkIndex ?? 0].name)")

        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $categoryFilter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favourites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }

            // this will be presented as a Placeholder for the second view in wide layouts. Adding the second child view automatically converts the list to use the sidebar list style.
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[selectedLandmarkIndex ?? 0])
        // here we perform a look-up to ensure that we are modifying the landmark stored in the model, and not a copy
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
