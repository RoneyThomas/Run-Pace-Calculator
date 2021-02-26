//
//  ContentView.swift
//  Shared
//
//  Created by Roney Thomas on 2020-11-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
//        PaceView()
        TabView {
            PaceView().tabItem{
                Image(systemName: "1.circle")
                Text("Pace Calculator")
            }
            ConversionView().tabItem{
                Image(systemName: "2.circle")
                Text("Conversion")
            }
        }
        #else
        Text("Hello, world!")
            .padding()
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
