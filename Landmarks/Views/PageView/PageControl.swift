//
//  PageControl.swift
//  Landmarks
//
//  Created by jugomo on 20/3/22.
//

import UIKit
import SwiftUI

/// custom UIPageControl wrapped in a SwiftUI UIViewRepresentable view. Allows to bridge UIKit views into SwiftUI
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int


    // MARK: - UIViewRepresentable -

    /// UIViewRepresentable and UIViewControllerRepresentable types have the same life cycle, with methods that correspond to their underlying UIKit types.

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
//        control.pageIndicatorTintColor = .lightGray
//        control.currentPageIndicatorTintColor = .blue

        // add the coordinator as the target for the vualueChanged event
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }


    // MARK: - Coordinator -

    ///creates the custom instance that you use to communicate changes from your view to other parts of the SwiftUI interface
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc
        /// because UIControl subsclasses like UIPageControl use target-action pattern instead of delegation, this Coordinator implements an @objc method to update the current page binding
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }

}
