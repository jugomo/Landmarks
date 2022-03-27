//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    /// put the modelObject in the environment
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData) // supply the model object to the view hierarchy
        }
        
        #if os(watchOS)
            /// when Apple Watch receives a notification, it looks for a scene in your app associated with the notification's category
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
