//
//  ProfileHost.swift
//  Landmarks
//
//  Created by jugomo on 20/3/22.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default

    /// create a copy to avoid updating the global app state before confirming any edits
    @EnvironmentObject var modelData: ModelData

    /// SwiftUI provides storage in the environment for values you can access using this wrapper. Access the editMode to read or write the edit scope.
    @Environment(\.editMode) var editMode

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile) //draftProfile
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())

        // even though this view does not declare a property with the @EnvironmentObject attribute, the child ProfileSummary does, so without this modifier the preview fails.
    }
}
