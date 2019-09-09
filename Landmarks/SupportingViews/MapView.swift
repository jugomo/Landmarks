//
//  MapView.swift
//  CombineViews
//
//  Created by julio on 08/09/2019.
//  Copyright © 2019 julio. All rights reserved.
//

import SwiftUI
import MapKit

// declare UIViewRepresentable conformance for the MapView type
struct MapView: UIViewRepresentable {
    // creates an MKMapView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // sets the map view's region to the correct coordinates to center the map
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 36.71, longitude: -4.43)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
