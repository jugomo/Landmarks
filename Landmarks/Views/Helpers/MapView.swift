//
//  MapView.swift
//  Landmarks
//
//  Created by jugomo on 19/3/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    /// use storage key that uniquely identifies the parameter like in UserDefaults. This is the underlying mechanism that SwiftUI relies on
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    var coordinate: CLLocationCoordinate2D

    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }

    /// this computed property allows to refresh the map whenever the delta changes
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate,
                           span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
    }


    // MARK: - Main View -

    var body: some View {
        Map(coordinateRegion: .constant(region))
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 36.739, longitude: -4.450))
    }
}
