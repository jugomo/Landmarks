//
//  LandmarksCommands.swift
//  Landmarks
//
//  Created by jugomo on 27/3/22.
//

import SwiftUI

struct LandmarksCommands: Commands {
    /// this property wrapper allow to track the currently selected landmark
    @FocusedBinding(\.selectedLandmark) var selectedLandmark

    /// this computed property is mandatory and uses builder semantics
    var body: some Commands {

        /// this built-in command set includes the command for toggling the sidebar
        SidebarCommands()

        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
//                print("BUTTON: \(selectedLandmark)")
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }

}

struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {

    /// the pattern for defining focused values resembles the pattern for defining new Environment values: Use a private key to read and write a custom property on the system-defined FocusedValues structure
    var selectedLandmark: Binding<Landmark>? {
        get {
//            print("GET: \(self[SelectedLandmarkKey.self])")
            return self[SelectedLandmarkKey.self]
        }
        set {
//            print("SET: \(newValue?.name.wrappedValue)")
            self[SelectedLandmarkKey.self] = newValue
//            print("GET: \(self[SelectedLandmarkKey.self]?.name.wrappedValue)")
        }
    }
}
