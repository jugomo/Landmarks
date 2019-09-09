//
//  ContentView.swift
//  Landmarks
//
//  Created by julio on 09/09/2019.
//  Copyright © 2019 julio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 600)
            
            CircleImage()
                .offset(y: -60)
                .padding(.bottom, -60)
            
            VStack(alignment: .leading) {
                Text("Málaga!")
                .font(.title)
                .foregroundColor(.green)
                .bold().italic()
                
                HStack {
                    Text("Second line 1")
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text("Second line 2")
                    .foregroundColor(.yellow)
                    .bold()
                }
            }.padding(20)
            
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
